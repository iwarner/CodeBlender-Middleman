##
# Namespace
##
@App =
    Model      : {}
    Controller : {}
    View       : {}
    Utils      : {}
    Classes    : {}

##
# Logger
# https://developers.google.com/chrome-developer-tools/docs/console
#
# Todo: Default the @log to be @log.info
##
class App.Utils.Logger

    # All of the logging commands to support
    Cmds = [ 'assert', 'clear', 'count', 'debug', 'dir', 'dirxml', 'error',
             'exception', 'group', 'groupCollapsed', 'groupEnd', 'info', 'log',
             'markTimeline', 'profile', 'profileEnd', 'table', 'time', 'timeEnd',
             'timeStamp', 'trace', 'warn' ]

    ##
    # Constructor
    ##
    constructor : ( @isDev = true ) ->

        for name in Cmds

            # Generate the logging function
            @[ name ] = do ( name ) ->
                ->
                    # If debugging is enabled and this browser has a console
                    if @isDev and window.console?
                        window.console[ name ].apply( console, arguments )

        # Alias debug() to log()
        @debug = @log