##
# Editor
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Editor extends Backbone.View

    ##
    # Initialize
    ##
    initialize : ->

        CKEDITOR.replace "editor1",
            customConfig : ""
            skin         :  'moono'