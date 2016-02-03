##
# Angular UI grid controller
#
# @category organism
# @author   Ian Warner <ian.warner@drykiss.com>
##

##
# JS lint
##
'use strict'

##
# Controller
##
AngularUIGridController = ( $scope, $filter, AngularUIGridService ) ->

    console.log "Angular UI grid - controller"

    # # This
    # vm = this

    # # Service calls row
    # vm.editModal = ContentService.editModal
    # vm.addModal  = ContentService.addModal
    # vm.delete    = ContentService.delete

    # # Grid options
    # vm.gridOptions =

    #     enableFiltering   : true
    #     enableSorting     : true
    #     enableColumnMenus : false
    #     minRowsToShow     : 15

    #     columnDefs        : [
    #         { field : '_id', width : 200 }
    #         { field : 'title' }
    #         { field : 'id', name: 'Actions', cellTemplate : 'content.button.html', width : 68, enableSorting: false, enableFiltering : false }
    #     ]

    #     onRegisterApi : ( gridApi ) ->
    #         vm.gridApi = gridApi
    #         return

    # ##
    # # Broadcast update
    # ##
    # $scope.$on 'updated', ( event ) ->
    #     activate()
    #     return

    # ##
    # # Get all promise
    # ##
    # activate = ->

    #     ContentService.read().then ( data ) ->

    #         # Set Data
    #         vm.gridOptions.data = data.result
    #         vm.total            = data.result.length

    #         ##
    #         # Filter data
    #         ##
    #         vm.filterData = ->
    #             vm.gridOptions.data = $filter( 'filter' )( data.result, vm.searchText, undefined )
    #             return

    # ##
    # # Activate
    # ##
    # activate()

    return

# Module
angular
    .module     'app.controller'
    .controller 'AngularUIGridController', AngularUIGridController

##
# Inject
##
AngularUIGridController.$inject = [
    '$scope'
    '$filter'
    'AngularUIGridService'
]