##
# Application Combined JavaScript
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# JS Lint
##
'use strict'

# Module
codeBlenderControllers = angular.module 'codeBlenderControllers'

##
# Phone List Controller
##
codeBlenderControllers.controller 'PhoneListCtrl', [
    '$scope'
    '$http'
    ( $scope, $http ) ->

        $http.get( '/assets/javascripts/data/phones.json' ).success ( data ) ->
            $scope.phones = data.splice 0, 10
            return

        $scope.orderProp = 'age';

        console.log "HERE"

        return
]