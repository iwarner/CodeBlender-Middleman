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

        $firebaseAuth utilities.ref()

]