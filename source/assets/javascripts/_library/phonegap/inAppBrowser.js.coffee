##
# In App Browser Class
#
# The InAppBrowser is a web browser view that displays when calling window.open(),
# or when opening a link formed as <a target="_blank">.
#
# The InAppBrowser window behaves like a standard web browser, and can't access
# Cordova APIs.
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://github.com/apache/cordova-plugin-inappbrowser/blob/master/doc/index.md
##
class App.PhoneGap.InAppBrowser

    ##
    # Add Event Listener
    ##
    addEvent : ->

    ##
    # Remove Event Listener
    ##
    removeEvent : ->

    ##
    # Close
    ##
    close : ->

    ##
    # Open
    ##
    open : ( url, target, options )  ->

        log.info url
        log.info target
        log.info options

        # var ref = window.open(url, target, options);

    ##
    # Execute Script
    ##
    executeScript : ->

    ##
    # Insert CSS
    ##
    insertCSS : ->
