##
# Auth with Firebase
##

##
# JS Lint
##
'use strict'

# Module
angular
    .module 'app.auth'

##
#
##
.factory 'auth', [

    '$firebaseAuth'
    'utilities'

    ( $firebaseAuth, utilities ) ->

        # $firebaseAuth utilities.ref()

        # Just added for now so it does not error remove when uncomment above
        return false

]