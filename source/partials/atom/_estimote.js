##
# Estimote Beacons
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Classes.Estimote

    ##
    # Create
    ##
    create : ->

        window.EstimoteBeacons.startRangingBeaconsInRegion ->

            setInterval (->

                window.EstimoteBeacons.getBeacons ( data ) ->

                return

            ), 1000