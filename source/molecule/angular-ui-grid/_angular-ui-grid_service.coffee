##
# Angular UI grid service
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category molecule
##

##
# JS lint
##
'use strict'

##
# Service
##
AngularUIGridService = ( $rootScope, $q, $http, $uibModal ) ->

    # URL
    url = "/assets/javascripts/data/phones.json?"

    # Debug
    console.log "Angular UI grid - service", url

    # Return
    {
        ##
        # Create
        #
        # @param  formData
        # @return array
        ##
        create : ( formData ) ->

            # Push in scope
            that = @

            # Create promise
            deferred = $q.defer()

            # Remove unwanted nodes from the form data
            delete formData.header
            delete formData.button
            delete formData.submitForm

            # Convert data to milliseconds
            formData.date = formData.date.getTime()

            # Add array brackets
            formData.interestCodes = "[" + formData.interestCodes + "]"
            formData.tags          = "[" + formData.tags + "]"
            formData.countries     = "[" + formData.countries + "]"

            ##
            # Create the content
            ##
            $http.put( url, [ formData ] )

            # Success
            .success ( data ) ->

                # Return success
                deferred.resolve data
                $rootScope.$broadcast 'updated'

                return

            deferred.promise

        ##
        # Read
        #
        # @return array
        ##
        read : ->

            # Push in scope
            that = @

            # Create promise
            deferred = $q.defer()

            # Request the interests JSON
            $http.get( url )

            # Success
            .success ( data ) ->

                deferred.resolve data

                return

            deferred.promise

        ##
        # Update
        #
        # @return array
        # @see    http://stackoverflow.com/questions/12576798/how-to-watch-service-variables
        ##
        update : ( formData ) ->

            # Push in scope
            that = @

            # Create promise
            deferred = $q.defer()

            # Remove unwanted nodes from the form data
            delete formData.header
            delete formData.button
            delete formData.submitForm

            ##
            # Create the content
            ##
            $http.post( url + formData._id, formData )

            # Success
            .success ( data ) ->

                # Return success
                deferred.resolve data
                $rootScope.$broadcast 'updated'

                return

            deferred.promise

        ##
        # Delete
        #
        # @return array
        ##
        delete : ( grid, row ) ->

            # Push in scope
            that = @

            # Create promise
            deferred = $q.defer()

            # Request the interests JSON
            $http.delete( PATH.API + PATH.OFFER + row.entity._id )

            # Success
            .success ( data ) ->

                deferred.resolve data
                $rootScope.$broadcast 'updated'

                return

            deferred.promise

            return

        ##
        # Edit row
        ##
        addModal : ->

            $modal.open
                templateUrl  : 'content.modal.html'
                controller   : 'ContentAddController'
                controllerAs : 'modal'

        ##
        # Edit row
        ##
        editModal : ( grid, row ) ->

            $modal.open
                templateUrl  : 'content.modal.html'
                controller   : 'ContentEditController'
                controllerAs : 'modal'
                resolve :
                    grid : ->
                        grid
                    row : ->
                        row

            return

    }

# Module
angular
    .module  'app.service'
    .service 'AngularUIGridService', AngularUIGridService
    .constant 'ContentSchema',
      type: 'object'
      properties:
        name:
          type: 'string'
          title: 'Name'
        company:
          type: 'string'
          title: 'Company'
        phone:
          type: 'string'
          title: 'Phone'

##
# Inject
##
AngularUIGridService.$inject = [
    '$rootScope'
    '$q'
    '$http'
    '$uibModal'
]
