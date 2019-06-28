# Facebook share directive
#
# @usage
# require 'social/facebook/share-button/_share-button_directive.coffee'
# class: "facebookShareButton"
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category atom

# Angular clear button
angular.module 'app.directive'

# Directive
.directive 'facebookShareButton', [
  () ->

    'use strict'

    {
      # Options
      restrict: 'C'
      scope: true
      replace: true

      # Link
      link: (scope, element, attrs, ctrl) ->

        # Capture the click
        angular.element(element).on 'click', (e) ->

          # FB hash
          fbHash = {}
          fbHash.method = 'share'
          fbHash.mobile_iframe = true

          # URL - required
          fbHash.href = attrs.url

          # Optional
          fbHash.hashtag = if attrs.hashtag then '#' + attrs.hashtag else undefined
          fbHash.quote = if attrs.quote then attrs.quote else undefined

          # Facebook share
          FB.ui (

            fbHash

           ), (response) ->

            if window.ga && ga.create
              # Send Google click stat
              ga 'send', 'pageview', '/facebook/click/' + fbHash.href
              ga 'send', 'social', 'facebook', 'facebook_click', fbHash.href
            return

        return
    }
]
