##
# Add
#
# @category organism
# @author   Ian Warner <ian.warner@drykiss.com>
#
# @todo Create the Error States based on passing through the model service to check the schema
##

##
# JS lint
##
'use strict'

##
# Controller
##
ContentAddController = ( $scope, $filter, $modalInstance, $timeout, ContentService ) ->

    # This
    vm = this

    # Change Title
    vm.header = "Add Content"
    vm.button = "Add"

    # Dummy Prefill - Comment out for production
    # vm._id           = "GBE03635USEN"
    # vm.title         = "Transforming procurement to drive the enterprise agenda"
    # vm.url           = "http://google.com"
    vm.docType       = "offer"
    # vm.interestCodes = "SWP10,CA108"
    # vm.tags          = "Big data, Predictive analytics"
    # vm.synopsis      = "To understand the underpinnings of their success, the IBM Institute for Business Value and Economist Intelligence Unit surveyed 1,023 CPOs from organizations with annual revenue in excess of US$1 billion. We also took a close look at the 100 companies that achieved the most impressive revenue and profit performance relative to their industry peers so that we could understand the strategies and actions that account for their uniquely valuable contributions to the enterprise."
    # vm.countries     = "US,CA"

    # Select Defaults
    vm.type          = "analystResearch"
    vm.buyingStage   = "learn"
    vm.format        = "pdf"
    vm.solutionArea  = "Analytics"

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
            ContentService.create( angular.copy( vm ) ).then ( data ) ->

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
    .controller 'ContentAddController', ContentAddController

##
# Inject
##
ContentAddController.$inject = [

    '$scope'
    '$filter'
    '$modalInstance'
    '$timeout'
    'ContentService'

]
