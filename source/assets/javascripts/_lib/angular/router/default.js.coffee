##
# Router
##

##
# JS Lint
##
'use strict'

# Module
codeBlender = angular.module( 'codeBlender' )

##
# Config
#
# @param routeProvider    NGRouter
# @param locationProvider To remove the Hash
##
codeBlender.config [
    '$routeProvider'
    '$locationProvider'
    ( $routeProvider, $locationProvider ) ->

        $routeProvider.

            when( '/prototyping/datatable',
                   controller : 'DataTableCtrl' ).

            when( '/prototyping/scaffolding/timeline.html',
                   controller : 'TimelineCtrl' ).

            when( '/',
                  templateUrl : 'views/phone-list.html'
                  controller  : 'PhoneListCtrl' )

        # Location Provider : Removes Hash
        # $locationProvider.html5Mode true
]

# Module
codeBlenderControllers = angular.module( 'codeBlenderControllers', [] )