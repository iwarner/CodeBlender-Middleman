/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
var app = {
    // Application Constructor
    initialize: function() {
        this.bindEvents();
    },
    // Bind Event Listeners
    //
    // Bind any events that are required on startup. Common events are:
    // 'load', 'deviceready', 'offline', and 'online'.
    bindEvents: function() {
        document.addEventListener('deviceready', this.onDeviceReady, false);
    },
    // deviceready Event Handler
    //
    // The scope of 'this' is the event. In order to call the 'receivedEvent'
    // function, we must explicity call 'app.receivedEvent(...);'
    onDeviceReady: function() {
        app.receivedEvent('deviceready');
    },
    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
        var listeningElement = parentElement.querySelector('.listening');
        var receivedElement = parentElement.querySelector('.received');

        listeningElement.setAttribute('style', 'display:none;');
        receivedElement.setAttribute('style', 'display:block;');

        var beaconManager = new BeaconManager();
        var beaconsList = document.getElementById('beacons');
        beaconManager.startPulling(1000);
        beaconManager.on('updated', function(beacon){
            var item = document.getElementById('beacon_' + beacon.major + '_' + beacon.minor);

            if(item) {
                item.innerText = beacon.major + '/' + beacon.minor + ' - ' + formatDistance(beacon.distance);
            }
        });
        beaconManager.on('added', function(beacon) {
            var item = document.createElement('li');
            item.innerText = beacon.major + '/' + beacon.minor + ' - ' + formatDistance(beacon.distance);
            item.id = 'beacon_' + beacon.major + '_' + beacon.minor;

            beaconsList.appendChild(item);
        });
        beaconManager.on('removed', function(beacon) {
            var item = document.getElementById('beacon_' + beacon.major + '_' + beacon.minor);

            if(item) {
                beaconsList.removeChild(item);
            }
        });

        console.log('Received Event: ' + id);
    }
};

function formatDistance(meters) {
    if(meters > 1) {
        return meters.toFixed(3) + ' m';
    } else {
        return (meters * 100).toFixed(3) + ' cm';
    }
}