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
    'ui.checkbox'

    'app.controllers'
    'app.config'
    'app.security'
    'app.auth'
    'app.filters'
    'app.utilities'

    'firebase'

    'ngClipboard'
    'ngStorage'

    'mailChimp'

    'datatables'
    'datatables.bootstrap'

]