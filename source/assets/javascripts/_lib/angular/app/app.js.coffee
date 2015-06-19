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
angular.module 'app',  [


    'ui.router'


    'app.controllers'
    'app.config'
    'app.security'


    'firebase'

    'app.auth'
    'app.filters'
    'app.utilities'

]