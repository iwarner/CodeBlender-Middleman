##
# Portfolio controller
#
# @usage
# # Portfolio
# require_tree template/portfolio
#
# @author    Ian Warner <ian.warner@drykiss.com>
# @category template
##

##
# JS lint
##
'use strict'

##
# Portfolio controller
##
PortfolioController = ( $log ) ->

    # Debug
    $log.log "Portfolio controller"

    # Create the mix on the portfolio grid
    angular.element( '.portfolio__grid' ).mixItUp()

    # Instantiate the tooltip
    angular.element( ".filter a" ).tooltip
        animation : "true"
        container : "body"
        html      : false
        placement : "top"
        trigger   : "hover"

    return

##
# Module
##
angular
    .module     'app.controller'
    .controller 'PortfolioController', PortfolioController

##
# Inject
##
PortfolioController.$inject = [
    '$log'
]
