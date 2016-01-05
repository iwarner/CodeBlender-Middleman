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
# Set Modules
#
# @param ngRoute Router
# @param codeBlenderControllers Controller
##
angular
    .module 'app',  [

        'ui.router'
        'ui.checkbox'

        'app.auth'
        'app.config'
        'app.controller'
        'app.directive'
        'app.filters'
        'app.security'
        'app.utilities'

        'firebase'

        'ngClipboard'
        'ngStorage'

        'mailChimp'

        'datatables'
        'datatables.bootstrap'

    ]

# Module
angular.module 'app.auth',       []
angular.module 'app.config',     []
angular.module 'app.controller', []
angular.module 'app.directive',  []
angular.module 'app.filters',    []
angular.module 'app.security',   []
angular.module 'app.utilities',  []