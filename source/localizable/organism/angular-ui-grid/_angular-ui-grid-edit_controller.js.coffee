##
# Edit Content
#
# @category Lib
# @author   Ian Warner <ian.warner@drykiss.com>
##

##
# JS Lint
##
'use strict'

##
# Controller
##
ContentEditController = ( $scope, $filter, $modalInstance, $timeout, ContentService, grid, row ) ->

    # This
    vm = this

    # Change Title
    vm.header = "Edit Content"
    vm.button = "Edit"

    # Array of Entities
    names = [ "_id", "title", "url", "docType", "interestCodes", "tags", "synopsis", "countries", "type", "buyingStage", "format", "solutionArea" ]

    # Fill Date
    vm.date = new Date( $filter( 'date' )( row.entity.date, 'yyyy-MM-dd' ) )

    # Fill Form from Row
    for name in names
        vm[ name ] = row.entity[ name ]

    ##
    # Handle Form Submission
    ##
    vm.submitForm = ( isValid ) ->

        # Broadcast Errors on Submit click
        $scope.$broadcast 'show-errors-check-validity'

        # If Valid
        if isValid

            # Call the Create Service
            # Pass the Form Data through
            ContentService.update( angular.copy( vm ) ).then ( data ) ->

                # Put modal into loading
                vm.showTakeover = true

                # Dismiss after 2 seconds
                $timeout (->
                    $modalInstance.dismiss 'cancel'
                ), 2000

                # Reload the grid

        else
            console.log "Not Valid"

        return

    return

# Module
angular
    .module     'app.controller'
    .controller 'ContentEditController', ContentEditController

##
# Inject
##
ContentEditController.$inject = [

    '$scope'
    '$filter'
    '$modalInstance'
    '$timeout'
    'ContentService'
    'grid'
    'row'

]
