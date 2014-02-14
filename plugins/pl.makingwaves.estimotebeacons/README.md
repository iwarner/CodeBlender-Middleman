Estimote Beacons PhoneGap plugin
========================
- Just a wrapper around Estimote iOS SKD ( https://github.com/Estimote/iOS-SDK )
- *NOTE* This is work in progress, it's not even a beta version yet. **Everything may change!**
- *NOTE* It's my first encounter with Objective-C and PhoneGap plugins. Therefore, code may be rubbish, however ATM it's just a proof of concept.
- Please **do** ask questions and give feedback. I will appreciate all input.

## Proof of concept app
I was able to build an app on the top of this plugin: http://www.youtube.com/watch?v=-cgvEY4ywM8

## Build process
What I'm doing now to build my app is:

- Call `phonegap build ios`
- Install this plugin by calling `phonegap local plugin add https://github.com/kdzwinel/phonegap-estimotebeacons`
- Run the app from the Xcode

## Basic usage

    // start looking for beacons
    window.EstimoteBeacons.startRangingBeaconsInRegion(function () {
        //every now and then get the list of beacons in range
        setInterval(function () {
            window.EstimoteBeacons.getBeacons(function (data) {
                //do something cool with the list of beacons
            });
        }, 1000);
    });

See [/examples](https://github.com/kdzwinel/phonegap-estimotebeacons/tree/master/examples) directory for sample PhoneGap application(s).
    
## Available methods
Not all methods are listed below, see [EstimoteBeacons.js](https://github.com/kdzwinel/phonegap-estimotebeacons/blob/master/www/EstimoteBeacons.js) for a full list.

### startRangingBeaconsInRegion
`EstimoteBeacons.startRangingBeaconsInRegion(successCallback) ...` Starts looking for beacons.

### stopRangingBeaconsInRegion
`EstimoteBeacons.stopRangingBeaconsInRegion(successCallback) ...` Stops looking for beacons.

### getBeacons
`EstimoteBeacons.getBeacons(successCallback) ... ` Returns latest list of beacons found by `startRangingBeaconsInRegion` or `startEstimoteBeaconsDiscoveryForRegion`. You have to call this method periodically to be up to date with latest results.

### connectToBeacon
`EstimoteBeacons.connectToBeacon(major, minor, callback, errorCallback) ...`
Allows you to connect to the beacon by providing major/minor of the beacon.

- *NOTE* Connected beacon stops broadcasting and goes 'invisible' until it's disconnected again.
- *NOTE* You can be connected only to the one beacon at the time.
- *NOTE* You need to connect to the beacon to get some of its details (frequency, power, software version, etc.) and do any *write* opperatons (update software, change frequency etc.).

### connectToBeaconByMacAddress
`EstimoteBeacons.connectToBeaconByMacAddress(macAddress, callback, errorCallback) ...`
Allows you to connect to the beacon by providing its MAC Address. I used that to connect to the beacons with old software ( < v1.6 ).

- *NOTE* You have to use `startEstimoteBeaconsDiscoveryForRegion` to connect to the beacons with old software.

### getConnectedBeacon
`EstimoteBeacons.getConnectedBeacon(successCallback, errorCallback) ...` Returns information about connected beacon. Data will contain beacon details such as: frequency, battery level, software version etc. These kind of details are not available via `getBeacons`.

### disconnectFromBeacon
`EstimoteBeacons.disconnectFromBeacon(callback, errorCallback)...`
Disconnects you from the connected beacon. Since there can be only one, you don't have to provide major/minor or MAC.

### setAdvIntervalOfConnectedBeacon
`EstimoteBeacons.setAdvIntervalOfConnectedBeacon(advInterval, callback, errorCallback)...`
Sets the advertising interval (frequency) of the connected beacon. You can set anything between 80 and 3200.

### setPowerOfConnectedBeacon
`EstimoteBeacons.setPowerOfConnectedBeacon(power, callback, errorCallback) ...`
Sets the power of the connected beacon. You can choose from -40, -20, -16, -12, -8, -4, 0, 4.

### updateFirmwareOfConnectedBeacon
`EstimoteBeacons.updateFirmwareOfConnectedBeacon(progressCallback, successCallback, errorCallback) ..`
Updates the softwere of connected beacon (if needed).

- *NOTE* I was able to succesfully upgrade 3 devices with that method so it's tested, but still - use it with caution! Make sure that beacon is near the phone and that your phone has stable Internet connection.

### startVirtualBeacon
`EstimoteBeacons.startVirtualBeacon(major, minor, id, successCallback) ...`
Device starts advertising as a beacon with given major/minor and id.

- *NOTE* You can't conect to the virtual beacon.
- *NOTE* Device that acts as a virtual beacon can still see other beacons, but won't see itself.

### stopVirtualBeacon
`EstimoteBeacons.stopVirtualBeacon(successCallback) ...`
Device stops advertising as a beacon.
