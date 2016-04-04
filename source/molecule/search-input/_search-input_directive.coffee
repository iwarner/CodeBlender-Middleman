##
# Search input directive
#
# @usage
# require search-input/_search-input_directive
# "search-input-directive" => true
#
# @category molecule
# @author   Ian Warner <ian.warner@drykiss.com>
# @see      http://getbootstrap.com/javascript/#popovers
##

##
# JS lint
##
'use strict'

##
# Search input directive
##
CBSearchInputDirective = ->

    # Debug
    console.log "Search input - directive"

    ##
    # Option
    ##
    restrict : 'A'

    ##
    # Link
    ##
    link : ( scope, element, attributes, controller, transclude ) ->

        # Debug
        console.log "Search input - link"

        return

##
# Module
##
angular
    .module    'app.directive'
    .directive 'cbSearchInputDirective', CBSearchInputDirective

##
# Inject
##
# SearchInputDirective.$inject = [
# ]