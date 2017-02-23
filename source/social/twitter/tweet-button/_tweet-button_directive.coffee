##
# Twitter share directive
#
# @usage
# require 'social/twitter/tweet-button/_tweet-button_directive.coffee'
# class: "twitterShareButton"
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category atom
##

##
# Angular clear button
##
angular.module 'app.directive'

##
# Directive
##
.directive 'twitterShareButton', [

    '$log'

    ( $log ) ->

        'use strict'

        {
            # Options
            restrict : 'C'
            scope    : true
            replace  : true

            # Link
            link : ( scope, element, attrs, ctrl ) ->

                # Debug
                # $log.info "twitterShareButton - Scope :",   scope
                # $log.info "twitterShareButton - Element :", element
                $log.info "twitterShareButton - Attrs :",   attrs
                # $log.info "twitterShareButton - Ctrl :",    ctrl

                # Capture the click
                angular.element( element ).on 'click', ( e ) ->

                    # Debug
                    $log.info "twitterShareButton - event :", e

                    # Create share
                    twttr.widgets.createShareButton attrs.url, document.getElementById( 'twitterShare' )

                return
        }

]
