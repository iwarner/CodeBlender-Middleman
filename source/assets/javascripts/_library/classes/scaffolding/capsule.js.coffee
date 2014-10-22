##
# Animate Capsule
#
# @uathor Ian Warner <ian.warner@drykiss.com>
##
class App.Classes.Capsule

    ##
    # Start the processing capsule animation
    ##
    animateCapsule : ( target, options ) ->

        # Default options
        defaultOptions =
            eleCur       : 0
            frameWidth   : 150
            frameHeight  : 150
            spriteWidth  : 3900
            spriteHeight : 150
            speed        : 80

        if typeof options is "object"
            options = $.extend( defaultOptions, options )
        else
            options = defaultOptions

        options.eleCur = 0 if typeof options.eleCur is "undefined"

        el = $ target

        if el.length > 0

            el.css( { 'background-position' : options.eleCur + 'px 0px' } )

            options.eleCur = options.eleCur + options.frameWidth

            if options.eleCur >= options.spriteWidth
                options.eleCur = 0

            ti = setTimeout =>
                @animateCapsule( target, options )
            , options.speed

        else
            return false;