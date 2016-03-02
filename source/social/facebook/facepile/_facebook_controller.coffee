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

# # Core Methods
# # .init() Used to initialize and setup the SDK. All other SDK methods must be
# #         called after this one.
# # .api()  Make an API call to the Graph API.
# # .ui()   Used to trigger different forms of Facebook created UI dialogs, such
# #         as the Feed dialog, or the Requests dialog.
# #
# # @author Ian Warner <ian.warner@drykiss.com>
# ##
# class App.Utils.Facebook

#     ##
#     # Constructor
#     ##
#     constructor : ->

#         # Load the Facebook SDK Asynchronously
#         $.getScript "//connect.facebook.net/" + window.locale + "/all.js", ( data, textStatus, jqxhr ) ->

#             # Debug
#             # log.info data, textStatus, jqxhr

#             # Initialise Facebook
#             FB.init

#                 appId      : "<%= data.facebook.app.id %>"
#                 channelUrl : "<%= data.config.url %>channel.html"
#                 status     : true
#                 cookie     : true
#                 xfbml      : true