##
# User
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Models.User extends Backbone.Model

    # Initialize with negative/empty defaults
    # These will be overriden after the initial checkAuth
    defaults :
        id       : 0
        username : ''
        name     : ''
        email    : ''

    ##
    #
    ##
    url : ->
        App.API + '/user';