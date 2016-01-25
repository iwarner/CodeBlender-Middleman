##
# Device
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://www.abeautifulsite.net/blog/2011/11/detecting-mobile-devices-with-javascript/
# @see    http://blog.mobileesp.com/?page_id=60
##
class App.Classes.Device

    ##
    # Check
    ##
    isMobile : ->

        # Check if this is a mobile device
        /Cordova|Android|meego|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test( navigator.userAgent )