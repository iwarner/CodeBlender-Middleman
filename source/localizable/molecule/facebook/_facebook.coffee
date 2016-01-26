##
# Facebook load script
#
# @usage
# require molecule/facebook/facebook
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://developers.facebook.com/docs/javascript
# @see    https://developers.facebook.com/docs/plugins
# @see    http://blog.brunoscopelliti.com/facebook-authentication-in-your-angularjs-web-app/
# @see    http://hayageek.com/jquery-lazy-loading-scripts/
#
# @todo   Push the version into the config
# @todo   Sort out the local for this and the channel file
##

##
# JS lint
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
    js.src = '//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.4'

    fjs.parentNode.insertBefore js, fjs

    return

) document, 'script', 'facebook-jssdk'