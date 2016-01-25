##
# Orientation
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Classes.Orientation

    orientation : =>

        # Handle device orientation changes
        _handleOrientation = ->

            if device.landscape()
                _removeClass "portrait"
                _addClass "landscape"
            else
                _removeClass "landscape"
                _addClass "portrait"

        # Detect whether device supports orientationchange event,
        # otherwise fall back to the resize event.
        _supports_orientation = "onorientationchange" of window
        _orientation_event = if _supports_orientation then "orientationchange" else "resize"

        # Listen for changes in orientation.
        if window.addEventListener
            window.addEventListener _orientation_event, _handleOrientation, no
        else if window.attachEvent
            window.attachEvent _orientation_event, _handleOrientation
        else
            window[_orientation_event] = _handleOrientation

        _handleOrientation()