##
# Input File - Popover Preview Image
#
# Core Methods
# .constructor()  Used to initialize and setup the Image Previewer
# .loadPreview()  Reads and displays the image in the preview popover
# .clearPreview() Clears the image preview popover
# .closePreview() Closes the image preview popover
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://bootsnipp.com/snippets/featured/input-file-popover-preview-image
##
class App.Classes.FileImagePreviewPopover

    ##
    # initialise
    ##
    constructor : ->

        # Create the close button
        closebtn = $("<button/>",
            type    : "button"
            text    : "x"
            id      : "close-preview"
            style   : "font-size: initial;"
        )

        closebtn.attr "class", "close pull-right"

        # Set the popover default content
        $(".image-preview").popover
            trigger     : "manual"
            html        : true
            title       : "<strong>Preview</strong>" + $(closebtn)[0].outerHTML
            content     : "There's no image"
            placement   : "bottom"

    ##
    # Load the Image Preview in the PopOver
    ##
    loadPreview : ($this) ->
        img = $("<img/>",
            id      : "dynamic"
            width   : 250
        )
        file   = $this.files[0]
        reader = new FileReader()

        # Set preview image into the popover data-content
        reader.onload = (e) ->
            $( ".image-preview-input-title" ).text "Change"
            $( ".image-preview-clear" ).show()
            $( ".image-preview-filename" ).val file.name
            img.attr "src", e.target.result
            $( ".image-preview" ).attr( "data-content", $(img)[0].outerHTML ).popover "show"

        reader.readAsDataURL file

    ##
    # Hide the Popover and clear the image preview
    ##
    clearPreview : ->

        $( ".image-preview" ).attr( "data-content", "" ).popover "hide"
        $( ".image-preview-filename" ).val ""
        $( ".image-preview-clear" ).hide()
        $( ".image-preview-input input:file" ).val ""
        $( ".image-preview-input-title" ).text "Browse"

    ##
    # Hide the Popover
    ##
    closePreview : ->

        $( ".image-preview" ).popover "hide"

        # Hover before close the preview
        $( ".image-preview" ).hover (->
            $( ".image-preview" ).popover "show"
            return
        ), ->
            $( ".image-preview" ).popover "hide"
            return

##
# fileImagePreviewPopover
#
# @author Ian Warner <ian.warner@drykiss.com>
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