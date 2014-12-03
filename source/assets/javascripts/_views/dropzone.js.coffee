##
# Dropzone
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see
##
class App.Views.Dropzone extends Backbone.View

    ##
    # Initialize
    ##
    initialize : ->

        # Drop Zone Options
        window.Dropzone.options.myDropzone =
            acceptedFiles   : 'image/*'
            addRemoveLinks  : true
            maxFilesize     : 10
            method          : "post"
            parallelUploads : 5
            paramName       : "file"
            uploadMultiple  : false