##
# Session
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Models.Session extends Backbone.Model

    # Initialize with negative/empty defaults
    # These will be overriden after the initial checkAuth
    defaults :
        loggedIn : false
        user_id   : ""

    ##
    #
    ##
    initialize : ->

        # Singleton user object
        # Access or listen on this throughout any module with app.session.user
        @user = new App.Models.User
        return

    ##
    # URL
    ##
    url : ->
        App.API + "/auth"

    ##
    # Fxn to update user attributes after recieving API response
    ##
    updateSessionUser : ( userData ) ->

        # Debug
        # log.info userData

        @user.set _.pick( userData, _.keys( @user.defaults ) )
        return

    ##
    # Check for session from API
    # Called from app.js
    #
    # The API will parse client cookies using its secret token and return a user
    # object if authenticated
    ##
    checkAuth : ( callback, args ) ->

        self = this

        # Check if there are tokens in localstorage
        @fetch(

            # Debug
            # log.info "Fetching Storage", callback, args

            # Success
            success : ( mod, res ) ->

                # Debug
                # log.info mod, res

                if not res.error and res.user

                    self.updateSessionUser res.user
                    self.set logged_in : true
                    callback.success mod, res if "success" of callback

                else

                    self.set logged_in : false
                    callback.error mod, res if "error" of callback

                return

            # Error
            error : ( mod, res ) ->

                # Debug
                # log.info mod, res

                self.set logged_in : false
                callback.error mod, res if "error" of callback
                return

        # Complete
        ).complete ->

            # Debug
            log.info "Complete"

            callback.complete() if "complete" of callback
            return

        return

    ##
    # Abstracted fxn to make a POST request to the auth endpoint
    # This takes care of the CSRF header for security, as well as
    # updating the user and session after receiving an API response
    ##
    postAuth : ( opts, callback, args ) ->

        self     = this
        postData = _.omit( opts, "method" )

        # Set the CSRF Token in the header for security
        $.ajax(

            # Options
            url         : @url() + "/"
            contentType : "application/json"
            dataType    : "json"
            type        : "POST"

            # Before Send
            beforeSend  : ( xhr ) ->
                token = $( "meta[name=\"csrf-token\"]" ).attr( "content" )
                xhr.setRequestHeader "X-CSRF-Token", token if token
                return

            # Data
            data    : JSON.stringify( _.omit( opts, "method" ) )

            # Success
            success : ( res ) ->

                # Debug
                log.info res
                log.info res.user.id

                # Check Error
                unless res.error

                    if _.indexOf( [
                        "login"
                        "signup"
                    ], opts.method ) isnt -1

                        self.updateSessionUser res.user or {}

                        self.set
                            user_id   : res.user.id
                            logged_in : true

                    else
                        self.set logged_in: false

                    callback.success res if callback and "success" of callback

                else
                    callback.error res if callback and "error" of callback

                return

            error : ( mod, res ) ->
                callback.error res if callback and "error" of callback
                return

        ).complete ->
            callback.complete res if callback and "complete" of callback
            return

        return

    ##
    # Login
    ##
    login : ( opts, callback, args ) ->

        @postAuth _.extend( opts,
            method : "login"
        ), callback

        return

    ##
    # Logout
    ##
    logout : ( opts, callback, args ) ->

        @postAuth _.extend( opts,
            method : "logout"
        ), callback

        return

    ##
    # Signup
    ##
    signup : ( opts, callback, args ) ->

        @postAuth _.extend( opts,
            method : "signup"
        ), callback

        return

    ##
    # Remove Account
    ##
    removeAccount : ( opts, callback, args ) ->

        @postAuth _.extend( opts,
            method : "remove_account"
        ), callback

        return