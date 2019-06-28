# Twitter share directive
#
# @usage
# require 'social/twitter/tweet-button/_tweet-button_directive.coffee'
# class: "twitterShareButton"
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category atom
# @see      https://dev.twitter.com/web/tweet-button/javascript-create

# Angular clear button
angular.module 'app.directive'

# Directive
.directive 'twitterShareButton', [

  '$log'

  ($log) ->

    'use strict'

    {
      # Options
      restrict : 'C'
      scope    : true
      replace  : true

      # Link
      link : (scope, element, attrs, ctrl) ->

        # Debug
        # $log.info "twitterShareButton - Scope :",   scope
        # $log.info "twitterShareButton - Element :", element
        $log.info "twitterShareButton - Attrs :",   attrs.url
        # $log.info "twitterShareButton - Ctrl :",    ctrl

        # Capture the click
        element.on 'click', ( e ) ->

          # Debug
          $log.info "twitterShareButton - event :", e

          # Create share
          # @todo Implement the promise scheme for this
          # @todo add Analytics
          twttr.widgets.createShareButton attrs.url, document.getElementById( 'share' )

          twttr.widgets.createShareButton( '/', document.getElementById( 'share' ),
            count : 'none'
            text  : 'Sharing a URL using the Tweet Button'

          ).then (el) ->
            console.log 'Button created.'
            return

        return
    }

]
