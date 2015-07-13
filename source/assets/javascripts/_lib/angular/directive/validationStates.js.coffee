##
# Validation States
##

##
# JS Lint
##
'use strict'

# Module
angular.module 'app'

##
# Show Errors
##
.directive 'showErrors', ( $timeout, showErrorsConfig ) ->

    getShowSuccess = undefined
    linkFn         = undefined

    getShowSuccess = ( options ) ->

        showSuccess = undefined
        showSuccess = showErrorsConfig.showSuccess

        if options and options.showSuccess != null
            showSuccess = options.showSuccess

        showSuccess

    linkFn = ( scope, el, attrs, formCtrl ) ->

        blurred       = undefined
        inputEl       = undefined
        inputName     = undefined
        inputNgEl     = undefined
        options       = undefined
        showSuccess   = undefined
        toggleClasses = undefined
        blurred       = false
        options       = scope.$eval( attrs.showErrors )
        showSuccess   = getShowSuccess( options )
        inputEl       = el[ 0 ].querySelector( '[name]' )
        inputNgEl     = angular.element( inputEl )
        inputName     = inputNgEl.attr( 'name' )

        if !inputName
            throw 'show-errors element has no child input elements with a \'name\' attribute'

        inputNgEl.bind 'blur', ->
            blurred = true
            toggleClasses formCtrl[inputName].$invalid

        scope.$watch (->
            formCtrl[inputName] and formCtrl[inputName].$invalid
        ), ( invalid ) ->
            if !blurred
                return
            toggleClasses invalid

        scope.$on 'show-errors-check-validity', ->
            toggleClasses formCtrl[ inputName ].$invalid

        scope.$on 'show-errors-reset', ->

            $timeout (->

                el.removeClass 'has-success has-error has-feedback'
                el.find( ".form-control-feedback" ).addClass( 'ng-hide' )

                blurred = false

            ), 0, false

        toggleClasses = ( invalid ) ->

            el.addClass    'has-feedback'
            el.toggleClass 'has-error', invalid

            if !invalid
                el.find( ".form-control-feedback" ).removeClass( 'ng-hide fa-exclamation-triangle' ).addClass( 'fa-check' )
            else
                el.find( ".form-control-feedback" ).removeClass( 'ng-hide fa-check' ).addClass( 'fa-exclamation-triangle' )

            if showSuccess
                el.toggleClass( 'has-success', !invalid )
    {
    restrict : 'A'
    require  : '^form'
    compile: ( elem, attrs ) ->
        if !elem.hasClass( 'form-group' )
            throw 'show-errors element does not have the \'form-group\' class'
        linkFn
    }

##
# Config Profider
##
.provider 'showErrorsConfig', ->

    _showSuccess = undefined
    _showSuccess = false

    @showSuccess = ( showSuccess ) ->
        _showSuccess = showSuccess

    @$get = ->
        { showSuccess: _showSuccess }

    return