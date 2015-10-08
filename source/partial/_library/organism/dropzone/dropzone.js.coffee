##
# Dropzone
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://www.dropzonejs.com/
# @see    http://www.dropzonejs.com/bootstrap.html
##
class App.Views.Dropzone extends Backbone.View

    ##
    # Initialize
    ##
    initialize : ->

        # Drop Zone Options
        Dropzone.options.myDropzone =
            acceptedFiles   : 'image/*'
            addRemoveLinks  : true
            maxFilesize     : 10
            method          : "post"
            parallelUploads : 5
            paramName       : "file"
            uploadMultiple  : false