##
# Video
# Will assume an ID of video1 should non be passed through.
#
# @usage
# require 'atom/video/_video_controller.coffee'
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category atom
##

(->

    ##
    # Video controller
    ##
    VideoController = ( $log ) ->

        ##
        # Init
        ##
        init = () =>
            @mute      = mute
            @pausePlay = pausePlay

        ##
        # Mute the video
        #
        # @param id string Defaults to video1
        ##
        mute = ( id = "video1" ) =>
            # Video ID
            video = angular.element( document.querySelector( '#' + id ) )

            # Mute
            if video[ 0 ].muted
                video[ 0 ].muted = false
            else
                video[ 0 ].muted = true

        ##
        # Mute the video
        #
        # @param id string Defaults to video1
        ##
        pausePlay = ( id = "video1" ) =>
            # Video ID
            video = angular.element( document.querySelector( '#' + id ) )

            if video[ 0 ].paused

                # Play
                video[ 0 ].play()

            else
                video[ 0 ].pause()

        # Init
        init()

        return

    ##
    # Module
    ##
    angular
        .module     'app.controller'
        .controller 'VideoController', VideoController

    ##
    # Inject
    ##
    VideoController.$inject = [
        '$log'
    ]

)()
