##
# DataTable Controllers
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see     http://stackoverflow.com/questions/23637586/datatables-1-10-check-all-via-jquery
##

##
# JS Lint
##
'use strict'

# Module
angular.module 'app'

##
# DataTableCtrl
##
.directive 'checkbox', ->

    # Vars
    scope    : false
    require  : "ngModel"
    restrict : "E"

    # Controller
    controller : ( $scope, $localStorage, $element ) ->

        # Get Storage
        $scope.get = ->
            @storage = $localStorage.counter

        # Save into Local Storage
        $scope.save = ->

            console.log $scope.get()

            # @storage.counter = 10

            # $scope.$storage = $localStorage.$default
            #     archive: 42

                #     # Push Archive
                #     archive.push responseId

                #     # Save to Local Storage
                #     LS.setData PIVOT_STORAGE.ARCHIVE, archive
                #

        return

    # Link
    link : ( scope, elem, attrs, modelCtrl ) ->

        # Vars
        trueValue  = true;
        falseValue = false;

        # Bind Click
        elem.on 'click', ( event ) ->

            scope.$apply ->

                el     = angular.element event.currentTarget
                span   = el.children 'span'
                parent = el.parent().parent()

                if modelCtrl.$modelValue == falseValue

                    # Remove Class
                    parent.addClass 'highlight'

                    # Save into Storage
                    scope.save()

                else

                    # Add highlight
                    parent.removeClass 'highlight'

                # else

                #     # Remove from Local Storage
                #     index = archive.indexOf responseId

                #     if index > -1

                #         archive.splice index, 1

                #         # Save to Local Storage
                #         LS.setData PIVOT_STORAGE.ARCHIVE, archive


                return

        return
