##
# Offcanvas Model
#
##
class App.Models.Offcanvas extends Backbone.Model

    defaults :
        easing     : "Power1.easeOut"
        navOpen    : false
        subNavOpen : false

    getEasing : ->
        this.get "easing"

    setEasing : (val) ->
        this.set "easing", val