##
# Google geocoding Service
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Classes.GoogleGeoCode

    ##
    # Code Place
    ##
    codePlace : ( address, callback ) ->

        # Instantiate Google GeoCoder
        geoCode = new google.maps.Geocoder

        geoCode.geocode address: address, ( results, status ) ->

            if status is google.maps.GeocoderStatus.OK

                position = coords :
                    latitude  : results[ 0 ].geometry.location.k
                    longitude : results[ 0 ].geometry.location.A

                callback position

            else
                log.info "Geocode was not successful for the following reason: " + status

                return
