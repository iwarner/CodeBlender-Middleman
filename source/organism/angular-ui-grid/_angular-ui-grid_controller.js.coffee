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

    # Debug
    console.log "Angular UI grid - controller"

    # This
    vm = this

    # Service calls row
    vm.editModal = AngularUIGridService.editModal
    vm.addModal  = AngularUIGridService.addModal
    vm.delete    = AngularUIGridService.delete

    # Grid options
    vm.gridOptions =

        enableFiltering   : true
        enableSorting     : true
        enableColumnMenus : false
        minRowsToShow     : 15

        columnDefs : [
            { field : 'name' }
            { field : 'id', name: 'Actions', cellTemplate : 'content.button.html', width : 68, enableSorting: false, enableFiltering : false }
        ]

        onRegisterApi : ( gridApi ) ->
            vm.gridApi = gridApi
            return

    ##
    # Broadcast update
    ##
    $scope.$on 'updated', ( event ) ->
        activate()
        return

    ##
    # Get all promise
    ##
    activate = ->

        AngularUIGridService.read().then ( data ) ->

            # Debug
            console.log data

            # Set data
            vm.gridOptions.data = data
            vm.total            = data.length

            ##
            # Filter data
            ##
            vm.searchData = ->
                vm.gridOptions.data = $filter( 'filter' )( data, vm.searchText, undefined )
                return

    ##
    # Activate
    ##
    activate()

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
