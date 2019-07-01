# Autocomplete controller
#
# @usage
# require 'cbsocial/google/places/_autocomplete_controller.coffee'
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category social

# Controller
AutocompleteController = ( $http, $rootScope, $window ) ->

  # This
  vm = this

  # Variable
  vm.showError = false

  # Scroll fade in when 100px from the top
  angular.element(window).scroll ->

    if angular.element('#resolutionSize').is(':hidden')

      if angular.element(this).scrollTop() > 100
        angular.element('.findFood__position label, .findFood__link').fadeOut('slow')
      else
        angular.element('.findFood__position label, .findFood__link').fadeIn('slow')
      return

  ##
  # Add marker
  ##
  addMarker = (position, map) ->

    # Remove marker
    if @marker
      @marker.setMap null
      @marker = false

    # Marker
    @marker = new (google.maps.Marker)
      draggable : true
      map       : map
      position  : position

    # Add dragend event to new marker
    @marker.addListener 'dragend', handleDragEnd.bind @

  ##
  # Event listener for Dragend
  ##
  handleDragEnd = ( event ) ->
    # Save to Rootscope
    $rootScope.latitude  = event.latLng.lat()
    $rootScope.longitude = event.latLng.lng()
    return

  ##
  # Geocode place
  # Takes a place name and geocodes it into a location
  #
  # @see https://developers.google.com/maps/documentation/javascript/geocoding
  ##
  geocodePlace = (place) ->

    # Get country
    country = angular.element('.googlePlacesAutocomplete').attr('data-country')

    # GeoCoder
    geocoder = new google.maps.Geocoder()

    # Data
    data =
      address : place
      componentRestrictions :
        country : country

    # Geocode
    geocoder.geocode data, (responses) ->

      if responses and responses.length > 0

        # Get co-ordinates
        $rootScope.latitude = responses[0].geometry.location.lat()
        $rootScope.longitude = responses[0].geometry.location.lng()

        # Map
        # @todo Should create the map outside of this event really and just move later
        $rootScope.map = new (google.maps.Map) angular.element('.googleMap')[0],
          center            : responses[0].geometry.location
          mapTypeControl    : false
          panControl        : false
          zoomControl       : true
          streetViewControl : false
          zoom              : 15

        # Add marker
        addMarker responses[0].geometry.location, $rootScope.map

        # Update map
        angular.element( '#placesModal' ).on 'shown.bs.modal', ->
          google.maps.event.trigger $rootScope.map, 'resize'
          $rootScope.map.setCenter responses[ 0 ].geometry.location

      else
        return 'No address'

  ##
  # Find food submit on initial form
  #
  # @todo On Enter the Google Places  change event is fired + Submit - no XHR sent
  # @todo On click just the submit is fired
  # @todo Both will have no location associated to them
  ##
  vm.submit = ( event, isValid ) ->

    # Errors
    vm.showErrorBlank     = false
    vm.showErrorYQL       = false
    vm.showErrorNoService = false

    # If Valid
    if isValid

      if ! $rootScope.latitude
        geocodePlace($rootScope.place)

      # Check if modal is shown
      if ! angular.element('#placesModal').hasClass 'in'
        # Open up the modal window
        angular.element('#placesModal').modal 'show'

    # Show blank error
    else
      vm.showError      = true
      vm.showErrorBlank = true

    return

  ##
  # Find food confirm on modal
  ##
  vm.confirm = (url) ->

    # Errors
    vm.showErrorBlank     = false
    vm.showErrorYQL       = false
    vm.showErrorNoService = false

    # Set the data for the call
    data =
     "url"       : "#{url}/api/restaurants"
     "longitude" : $rootScope.longitude
     "latitude"  : $rootScope.latitude
     "format"    : "json"
     "version"   : "1.01"

    # Http get to YQL
    $http.get 'https://query.yahooapis.com/v1/public/yql/drykiss/DeliverooLocation', params : data

    # Then
    .then ((response) ->

      # URL
      if response.data.query.results.json.url
        # Hide errors
        vm.showError = false

        # Refresh the page to the URL results
        $window.location.href = "#{ url }#{ response.data.query.results.json.url }"

      else

        # Close modal
        angular.element('#placesModal').modal 'hide'

        # If there is an error close the modal and display the error message
        vm.showError          = true
        vm.showErrorNoService = true

    # Error
    ), ( response ) ->
      vm.showError    = true
      vm.showErrorYQL = true
      vm.errorMessage = response.data.error.description

  return

# Module
angular
  .module     'app.controller'
  .controller 'AutocompleteController', AutocompleteController

##
# Inject
##
AutocompleteController.$inject = [
  '$http'
  '$rootScope'
  '$window'
]
