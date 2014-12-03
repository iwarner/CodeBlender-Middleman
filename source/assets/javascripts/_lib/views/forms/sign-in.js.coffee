##
# Card
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.SignIn extends Backbone.View

    ##
    # Events
    ##
    events :
        "click #disconnect" : "disconnect"
        "click #signOut"    : "signOut"

    ##
    # Initialize
    ##
    initialize : =>

        # Load the Google Plus Asynchronously
        $.getScript "http://plus.google.com/js/client:plusone.js", =>

            # SignIn
            gapi.signin.render "signInButton",

                callback              : @onSignInCallback
                clientid              : "908346284125-9nc8k5avs5gsg4f53j058jotsedtodgc.apps.googleusercontent.com"
                requestvisibleactions : "https://schemas.google.com/AddActivity"
                scope                 : "https://www.googleapis.com/auth/plus.login"
                theme                 : "dark"
                cookiepolicy          : "single_host_origin"

    ##
    # onSignInCallback
    ##
    onSignInCallback : ( authResult ) =>

        gapi.client.load "plus", "v1", =>

            $("#authResult").html "Auth Result:<br/>"

            for field of authResult
                $("#authResult").append " " + field + ": " + authResult[field] + "<br/>"

            if authResult["access_token"]

                $("#authOps").show "slow"
                $("#gConnect").hide()
                @profile()
                @people()

            else if authResult['error']

                log.info "Sign-in state: " + authResult["error"]

                $("#authResult").append "Logged out"
                $("#authOps").hide "slow"
                $("#gConnect").show()

            log.info "authResult", authResult

    ##
    # Disconnect
    ##
    disconnect : ->

        # Revoke the access token.
        $.ajax
            type        : "GET"
            url         : "https://accounts.google.com/o/oauth2/revoke?token=" + gapi.auth.getToken().access_token
            async       : false
            contentType : "application/json"
            dataType    : "jsonp"

            success     : ( result ) ->

                log.info "revoke response: " + result
                $("#authOps").hide()
                $("#profile").empty()
                $("#visiblePeople").empty()
                $("#authResult").empty()
                $("#gConnect").show()

            error : ( e ) ->
                log.info e

    ##
    # Sign Out
    ##
    signOut : ( event ) ->

        gapi.auth.signOut()

    ##
    # People
    ##
    people : ->

        # Element
        el = $( "#visiblePeople" )

        request = gapi.client.plus.people.list
            userId     : "me"
            collection : "visible"

        request.execute ( people ) ->
            el.empty()

            append = """
                Number of people visible to this app: #{ people.totalItems }
                <br/>
            """

            el.append append

            for personIndex of people.items

                person = people.items[personIndex]

                append = """
                    <img src="#{ person.image.url }">
                """

                el.append append

    ##
    # Profile
    ##
    profile : ->

        # Element
        el = $( "#profile" )

        # Call User Information
        request = gapi.client.plus.people.get
            "userId" : "me"

        # Execute Call
        request.execute ( profile ) ->

            # Empty Profile
            el.empty()

            # Check Error
            if profile.error
                el.append profile.error

            # Append Information
            append = """
                <p>
                    <img src="#{ profile.image.url }">
                </p>
                <p>
                    Hello #{ profile.displayName }!
                    <br />
                    Tagline: #{  profile.tagline }
                    <br />
                    About: #{ profile.aboutMe }
                </p>
            """

            if profile.cover and profile.coverPhoto
                append += """
                    <p>
                        <img src="#{ profile.cover.coverPhoto.url }">
                    </p>
                """

            el.append append