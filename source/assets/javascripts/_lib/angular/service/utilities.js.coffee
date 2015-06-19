##
# Firebase Utilities
##

##
# JS Lint
##
'use strict'

# Module
angular.module 'app.utilities', []

##
#
##
.factory 'utilities', [

    '$window'
    'FBURL'
    '$q'

    ( $window, FBURL, $q ) ->

        ##
        # Path Reference
        ##
        pathRef = ( args ) ->

            i = 0

            while i < args.length

                if angular.isArray( args[ i ] )
                    args[ i ] = pathRef( args[ i ] )

                else if typeof args[ i ] != 'string'
                    throw n ew Error( 'Argument ' + i + ' to firebaseRef is not a string: ' + args[ i ] )

                i++

            args.join '/'

        ###*
        # Example:
        # <code>
        # function(firebaseRef) {
        # *       var ref = firebaseRef('path/to/data');
        # *    }
        # </code>
        #
        # @function
        # @name firebaseRef
        # @param {String|Array...} path relative path to the root folder in Firebase instance
        # @return a Firebase instance
        ###
        firebaseRef = ( path ) ->

            ref  = new ( $window.Firebase )( FBURL )
            args = Array::slice.call( arguments )

            if args.length
                ref = ref.child( pathRef( args ) )
            ref

        ##
        # Utilities
        ##
        utils =

            handler : ( fn, context ) ->

                utils.defer ( def ) ->

                    fn.call context, ( err, result ) ->

                        if err != null
                            def.reject err
                        else
                            def.resolve result
                        return
                    return

            defer : ( fn, context ) ->
                def = $q.defer()
                fn.call context, def
                def.promise

            ref: firebaseRef

        utils
]