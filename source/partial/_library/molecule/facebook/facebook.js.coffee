##
# Facebook Load Script
#
# @usage
# require molecule/facebook/facebook
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://developers.facebook.com/docs/plugins
##

##
# JS Lint
##
'use strict'

##
# Facebook
##

( ( d, s, id ) ->

    js  = undefined
    fjs = d.getElementsByTagName( s )[ 0 ]

    if d.getElementById id
        return

    js     = d.createElement s
    js.id  = id
    js.src = '//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3'

    fjs.parentNode.insertBefore js, fjs

    return

) document, 'script', 'facebook-jssdk'