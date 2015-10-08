##
# Portfolio Controller
#
# @usage
# # Portfolio
# require_tree template/portfolio
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://github.com/patrickkunka/mixitup/blob/master/docs/configuration-object.md
##

##
# JS Lint
##
'use strict'

##
# Portfolio Controller
##
PortfolioController = ->

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