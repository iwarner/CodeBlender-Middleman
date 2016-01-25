##
# Serialize
# @see https://github.com/hongymagic/jQuery.serializeObject
##

"use strict";

$ = jQuery

##
#
##
$.fn.serializeObject = ->
    "use strict"
    a = {}
    b = ( b, c ) ->
        d = a[ c.name ]
        ( if "undefined" isnt typeof d and d isnt null then ( if $.isArray( d ) then d.push( c.value ) else a[ c.name ] = [
            d
            c.value
        ]) else a[ c.name ] = c.value )
        return

    $.each( @serializeArray(), b )
    a