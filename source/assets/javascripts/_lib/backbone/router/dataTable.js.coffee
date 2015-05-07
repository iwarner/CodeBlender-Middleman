##
# DataTable Router
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Routers.DataTable extends Backbone.Router

    ##
    # Routes
    ##
    routes :

        "prototyping/datatable" : "datatable"

    ##
    # DataTable
    ##
    datatable : ->

        # Instantiate
        new App.Views.DataTable(
            el : ".container"
        ).render()