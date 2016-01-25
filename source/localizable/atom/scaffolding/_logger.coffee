##
# Logger
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Utils.Logger

    # Logging Commands
    Cmds = [ 'assert',
             'clear',
             'count',
             'debug',
             'dir',
             'dirxml',
             'error',
             'exception',
             'group',
             'groupCollapsed',
             'groupEnd',
             'info',
             'log',
             'markTimeline',
             'profile',
             'profileEnd',
             'table',
             'time',
             'timeEnd',
             'timeStamp',
             'trace',
             'warn' ]

    ##
    # Constructor
    #
    # @param isDev Bool Switch of showing logs if not in Dev mode
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

# Instantiate Utility
@log = new App.Utils.Logger