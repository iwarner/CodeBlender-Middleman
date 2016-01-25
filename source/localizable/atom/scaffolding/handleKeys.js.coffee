##
# Handle Keys
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Utils.HandleKeys

    # Sections Storage
    sections = []

    ##
    # Constructor
    ##
    constructor : ->

        # Loop through the sections
        $( "section" ).each ( i ) ->

            # Debug
            # log.info i, $( @ )

            # Push section id to the array
            sections.push $( @ ).attr( "id" ).split(' ').pop()

        # Event for handling Key Down
        $( document ).on "keydown", @keyAction

    ##
    # Key Action
    ##
    keyAction : ( event ) ->

        # Placeholder for Section
        section = false

        # URL fragment
        fragment = Backbone.history.fragment

        # Get the code for the Keypress
        code = event.keyCode || event.which

        # Check on Arrow Keys
        if code == 40 || code == 38

            # Prevent Default
            event.preventDefault()

            # Count Sections
            count = sections.length - 1

            # Check that fragment is in array and get position
            index = $.inArray fragment, sections

            # If down find the section in the array and go to the next one
            if code == 40 and index < count
                section = sections[ index + 1 ]

            # If up find the section in the array and go to the previous one
            else if code == 38 and index > 0
                section = sections[ index - 1 ]

            # Scroll
            if section
                scroll = new App.Classes.ScrollTop
                scroll.scrollTop section, 50

        # Debug
        # log.info sections
        # log.info fragment
        # log.info index
        # log.info count
        # log.info code

# Instantiate Utility
new App.Utils.HandleKeys