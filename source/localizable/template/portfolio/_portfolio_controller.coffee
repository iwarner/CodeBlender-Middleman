##
# Portfolio controller
#
# @usage
# # Portfolio
# require_tree template/portfolio
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://github.com/patrickkunka/mixitup/blob/master/docs/configuration-object.md
##

##
# JS lint
##
'use strict'

##
# Portfolio controller
##
PortfolioController = ->

    # Debug
    console.log "Portfolio controller"

    # Create the mix on the portfolio grid
    angular.element( '.portfolio__grid' ).mixItUp()

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
# PortfolioController.$inject = [
# ]