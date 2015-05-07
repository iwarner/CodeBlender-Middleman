##
# Application Initialisation
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# JS Lint
##
'use strict'

##
# Module
#
# @param ngRoute Router
# @param codeBlenderControllers Controller
##
codeBlender = angular.module( 'codeBlender',  [
    'ngRoute'
    'codeBlenderControllers'
    'codeBlender.filters'
] )