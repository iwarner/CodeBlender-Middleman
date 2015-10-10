##
# Template Loader for Backbone
# Loads an external template and caches it in local storage
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Classes.TemplateLoader

    ##
    # Variables
    ##
    templateVersion : "0.0.1"
    templates       : { }

    ##
    # Load Remote Template
    #
    # @param String templateName
    # @param String callback
    ##
    loadRemoteTemplate : ( templateName, callback ) ->

        # Check template exists
        unless @templates[ templateName ]

            self = this

            # AJAX call to load the template
            $.ajax {

                # Turn of asynchronous so we make sure DOM is loaded
                async   : false
                url     : templateName + ".html",

                success : ( data ) ->

                    # Add Template to Templates Array
                    self.addTemplate templateName, data

                    # Save Template to Local Storage
                    # self.saveLocalTemplates()

                    # Callback
                    callback data
            }

        else
            callback @templates[ templateName ]

    ##
    # Add Template
    ##
    addTemplate : ( templateName, data ) ->

        @templates[ templateName ] = data

    ##
    # Check Local Storage is Available
    ##
    localStorageAvailable : ->

        try
            return "localStorage" of window and window[ "localStorage" ] isnt null
        catch e
            return false

    ##
    # Save Template to local storage
    ##
    saveLocalTemplates : ->

        if @localStorageAvailable
            localStorage.setItem "templates", JSON.stringify( @templates )
            localStorage.setItem "templateVersion", @templateVersion

    ##
    # Load template from Local Storage
    ##
    loadLocalTemplates : ->

        if @localStorageAvailable
            templateVersion = localStorage.getItem( "templateVersion" )

            if templateVersion and templateVersion is @templateVersion
                templates = localStorage.getItem( "templates" )

                if templates
                    templates = JSON.parse( templates )

                    for x of templates
                        @addTemplate x, templates[ x ]  unless @templates[ x ]

            else

                localStorage.removeItem "templates"
                localStorage.removeItem "templateVersion"