##
# Clear button directive
#
# @usage
# <input type="text" id="fixed" clear-btn>
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category atom
##

##
# JS lint
##
'use strict'

##
# Angular clear button
##
angular.module 'app.directive'

##
# Directive
##
.directive 'clearBtn', [

    '$parse'

    ( $parse ) ->

        link : ( scope, elm, attr, ngModelCtrl ) ->

            # elm.wrap '<div style=\'position: relative\'></div>'

            btn        = '<span id=' + Math.round( Math.random() * 1000000000 ) + ' class="clear-button ng-hide fa fa-times-circle-o"></span>'
            angularBtn = angular.element( btn )

            elm.after angularBtn

            # clear the input
            angularBtn.on 'click', ( event ) ->

                # Set the triggers
                elm.val( '' ).trigger( 'change' ).trigger 'keyup'

                $parse( attr.ngModel ).assign scope, ''
                scope.$apply()

                return

            # show  clear btn  on focus
            elm.bind 'focus keyup change paste propertychange', ( blurEvent ) ->

                if elm.val() and elm.val().length > 0
                    angularBtn.removeClass 'ng-hide'
                else
                    angularBtn.addClass 'ng-hide'
                return

            # Remove clear btn on focus
            elm.bind 'blur', ( blurEvent ) ->

                if !angularBtn.is( ':hover' )
                    angularBtn.addClass 'ng-hide'
                return

            return
]
