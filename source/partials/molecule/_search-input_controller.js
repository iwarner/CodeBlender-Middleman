##
# Search input controller
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category molecule
##

##
# JS lint
##
'use strict'

##
# Search input controller
##
SearchInputController = ( $http, $log, $scope ) ->

    # Debug
    $log.info "Search - controller"

    # This
    vm = this

    # Controller loaded
    vm.controllerLoaded = true

    # Data
    vm.data = [ 'Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Dakota', 'North Carolina', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming' ]

    # <h4>Asynchronous results</h4>

    # <input type="text" ng-model="asyncSelected"
        # placeholder="Locations loaded via $http"
        # uib-typeahead="address for address in getLocation($viewValue)"
        # typeahead-loading="loadingLocations" typeahead-no-results="noResults" class="form-control">

    # <i ng-show="loadingLocations" class="glyphicon glyphicon-refresh"></i>

    # <div ng-show="noResults">
    #   <i class="glyphicon glyphicon-remove"></i> No Results Found
    # </div>

    ##
    # Search
    ##
    vm.search = ->

        # Debug
        $log.info "Search - search", vm.query
        return

    ##
    # Type ahead
    ##
    vm.complete = ( q ) ->

        # Debug
        $log.info "Search - complete", q

        # Direct call for speed
        $http.jsonp( "https://en.wikipedia.org/w/api.php?action=opensearch&format=json&formatversion=2&search=#{ q }&namespace=0&limit=10&suggest=true&callback=JSON_CALLBACK" ).then ( response ) ->
            response.data[ 1 ]

        return

    return

##
# Module
##
angular
    .module     'app.controller'
    .controller 'SearchInputController', SearchInputController

##
# Inject
##
SearchInputController.$inject = [
    '$http'
    '$log'
    '$scope'
]
