##
# Handle Clicks
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Utils.HandleClicks

    ##
    # Constructor
    ##
    constructor : ->

        # Delegate Clicks
        $( document ).on "tap", "a[ href^=# ]:not(.external)", ( event ) ->

            # Remove leading slashes and hash bangs ( backward compatablility )
            hash    = $( @ ).attr "href"

            $hashEl = $ hash

            # Check hash exists
            if $hashEl.length

                # Prevent default
                # Prevent the default if we need to stop/hijack default behaviour
                # ... like below...
                event.preventDefault()

                hashReplace = hash.replace /^.*?(#|$)/, ""

                # Remove the Hash ID from the element on the page
                $hashEl.attr "id", ""

                # Add the new URL to Backbone's history and update the URL
                Backbone.history.navigate hash,
                    trigger : true

                # Put the Hash ID back
                $hashEl.attr "id", hashReplace

                # Scroll
                scroll = new App.Classes.ScrollTop
                scroll.scrollTop hashReplace, 50

            else

                # Update page with hash tag
                if( hash != '#' && hash != '' )
                    window.location = "index.html" + hash

            # Debug
            # log.info hash, $hashEl
            # log.info event

# Instantiate Utility
new App.Utils.HandleClicks