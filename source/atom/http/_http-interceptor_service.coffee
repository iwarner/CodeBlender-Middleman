##
# HTTP Interceptor
# Use this for intercepting HTTP errors codes.
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category atom
# @see      http://onehungrymind.com/winning-http-interceptors-angularjs/
# @see      https://github.com/matys84pl/angularjs-nginclude-handling-404/
##

##
# JS lint
##
'use strict'

##
# HTTP Interceptor
##
HttpInterceptorService = ( $log, $q ) ->

    # Debug
    $log.log "HTTP interceptor"

    'responseError' : ( rejection ) ->

        # Debug
        $log.log "HTTP interceptor - reject", rejection

        # Reject promise on error
        $q.reject( rejection )

##
# Module
##
angular
    .module  'app.service'
    .service 'HttpInterceptorService', HttpInterceptorService

##
# Inject
##
HttpInterceptorService.$inject = [
    '$log'
    '$q'
]
