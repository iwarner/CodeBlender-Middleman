##
# fileImagePreviewPopover
#
# @author Pratomchai P
##
class App.Views.FileImagePreviewPopover extends Backbone.View

    ##
    # Events
    ##
    events :
        "click #close-preview"                   : "closePreview"
        "click .image-preview-clear"             : "clearPreview"
        "change .image-preview-input input:file" : "loadPreview"

    ##
    # Backbone Initialize
    ##
    initialize : ->

        # Instantiate Image Preview Popover
        @fImgPreviewPopOver = new App.Classes.FileImagePreviewPopover

    ##
    # Close the Preview Popover
    ##
    closePreview : ( event ) ->

        # Prevent default
        event.preventDefault()
        event.stopPropagation()

        # Element
        ct  = event.currentTarget
        $el = $ ct

        # App.Classes.fileImagePreviewPopover().closePreview
        @fImgPreviewPopOver.closePreview()

    ##
    # Clear the contents in the Preview Popover
    ##
    clearPreview : ( event ) ->

        # Prevent default
        event.preventDefault()
        event.stopPropagation()

        # Element
        ct  = event.currentTarget
        $el = $ ct

        @fImgPreviewPopOver.clearPreview()

    ##
    # Load the contents into and show the Preview Popover
    ##
    loadPreview : ( event ) ->

        # Element
        ct  = event.target

        @fImgPreviewPopOver.loadPreview ct