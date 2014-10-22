##
# Popover
# Utilises the Bootstrap Clickover plugin
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://www.leecarmichael.com/bootstrapx-clickover/examples.html
##
class App.Utils.Popover

    ##
    # Constructor
    ##
    constructor : ->

        # Options Overide data-attributes
        options =

            template  : """
                <div class="popover" role="tooltip">
                    <button type="button" data-dismiss="popover" class="close">&times;</button>
                    <div class="arrow"></div>
                    <h3 class="popover-title"></h3>
                    <div class="popover-content"></div>
                </div>"""
            html      :true
            # content   : d

        # Event for instantiating a popover
        # $( ".popMe" ).clickover( options )

        # Boostrap Method
        $( ".popMe" ).popover( options )

        this.bind_open_popups()
        this.bind_close_popups()

    # Open popups
    bind_open_popups : ->

        # Capture clicks on any tooltop/popover links
        $(document).on "click", ".popMe", (e) =>

            e.preventDefault()

            $('.popMe').not( $(e.currentTarget) ).popover('hide');

            # IE 8 fix - forces popover to work on ie8
            nav = navigator.userAgent.toLowerCase()
            $(e.currentTarget).popover("hide").popover "show"  if nav.indexOf("msie") isnt -1 and parseInt(nav.split("msie")[1]) is 8

    # Close popups
    bind_close_popups : ->

        $(document).on "click", "[data-dismiss=popover]", (e) =>
            e.preventDefault()

            $('.popMe').not( $(e.currentTarget) ).popover('hide');


# Instantiate Utility
new App.Utils.Popover