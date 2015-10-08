##
# Timeline
#
# @author Ian Warner <ian.warner@drykiss.com>
#
# @see http://leftshift.io/8-tips-for-angular-js-beginners/
##

##
# JS Lint
##
'use strict'

# Module
angular
    .module 'app.controller'

##
# Timeline Controller
##
.controller 'TimelineCtrl', [

    '$scope'
    '$http'
    '$log'

    ( $scope, $http, $log ) ->

        # Get the Data Source
        $http.get '/assets/javascripts/data/timeline.json'

            # Success
            .success ( data ) ->

                # JSON Data to the view
                $scope.timeLine = data.data

                # Debug
                # $log.info "Data :", data

                return

        #
        $scope.selectedType = []

        #
        $scope.typeList     = [
            {
                id   : "phone"
                name : 'Phone'
            }
            {
                id   : "envelope"
                name : 'Envelope'
            }
            {
                id   : "mobile"
                name : 'Mobile'
            }
        ]

        ##
        # Set Selected Type
        ##
        $scope.setSelectedType = ->
            id = @type.id
            if _.contains( $scope.selectedType, id )
                $scope.selectedType = _.without( $scope.selectedType, id )
            else
                $scope.selectedType.push id
            false

        #
        $scope.isChecked = ( id ) ->
            if _.contains( $scope.selectedType, id )
                return 'fa fa-check pull-right'
            false

        #
        $scope.checkAll = ->
            $scope.selectedType = _.pluck( $scope.typeList, 'id' )
            return

        # Handle the click on the Filter Icons
        $scope.filterInteraction = ( type ) ->

            # Append to the Filter
            $scope.data.filter = type

            # Toggle the Icon Colour
            if type == "!!"
                type = "all"

            $scope[ type ] = !$scope[ type ]

            # Debug
            $log.info "Clicked Icon", type

            return

        # Handle the click on the Modal Add Interaction
        $scope.modalAddInteraction = ->

            # Debug
            $log.info "Clicked Add Interaction"

            # Message
            $scope.msg = 'Launch Form Modal'

            return

        # Debug
        # $log.info "Scope :", $scope

        return
]

##
# Filer
##
angular.module( 'app.filters', [] ).filter 'timelineFilter', [ ->

    ( nodes, selectedType ) ->

        if !angular.isUndefined( nodes ) and !angular.isUndefined( selectedType ) and selectedType.length > 0

            tempClients = []

            angular.forEach selectedType, ( id ) ->

                angular.forEach nodes, ( node ) ->

                    if angular.equals( node.type, id )
                        tempClients.push node
                    return

                return

            tempClients

        else
            nodes
]