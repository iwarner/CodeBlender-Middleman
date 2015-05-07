##
# World Cup Sweep Stake
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.SweepStake extends Backbone.View

    ##
    # Events
    ##
    events :
        "click .sweepSelection" : "sweepSelection"

    ##
    # sweepSelection
    ##
    sweepSelection : ->

        log.info "SWEEP"

        # Set Interval
        @tt = setInterval( @selectImage, 200 )

        setTimeout (=>
            clearInterval @tt
        ), 3000

    ##
    # Select Image
    ##
    selectImage : ->

        # Element - Cant have owner attached
        el = $( ".panel img" )

        # Clear Borders
        el.css( "border", "none" )

        # Random Generator
        randomElement = el.get().sort( ->
            Math.round( Math.random() ) - 0.5
        ).slice( 0, 1 )

        # Set Border
        $( randomElement ).css( "border", "5px solid red" )