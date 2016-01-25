##
# AmChart
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://www.amcharts.com/
##
class App.Views.Amchart extends Backbone.View

    ##
    # Initialize
    ##
    initialize : ->

        chart = AmCharts.makeChart( 'chartdiv',

            'type'       : 'pie'
            'theme'      : 'chalk'
            "fontFamily" : 'HelveticaNeue-Light'

            'titles' : [ {
                'text' : 'Lead Completeness'
                'size' : 20
            } ]

            'dataProvider' : [
                {
                'country' : 'News'
                'visits'  : 7252
                }
                {
                'country' : 'Information'
                'visits'  : 3882
                }
                {
                'country' : 'Social'
                'visits'  : 1809
                }
                {
                'country' : 'IBM Related'
                'visits'  : 1322
                }
                {
                'country' : 'Campaign'
                'visits'  : 4322
                }
            ]

            'valueField'    : 'visits'
            'titleField'    : 'country'
            'startEffect'   : 'elastic'
            'startDuration' : 2
            'labelRadius'   : 15
            'innerRadius'   : '50%'
            'depth3D'       : 10
            'balloonText'   : '[[title]]<br><span style=\'font-size:14px\'><b>[[value]]</b> ([[percents]]%)</span>'
            'angle'         : 15

            'exportConfig'  : menuItems: [ {
                icon   : '/lib/3/images/export.png'
                format : 'png'
            } ])

        # Chart Input
        $(' .chart-input' ).off().on 'input change', ->

            property = $( this ).data( 'property' )
            target   = chart
            value    = Number( @value )

            chart.startDuration = 0

            if property == 'innerRadius'
                value += '%'

            target[property] = value
            chart.validateNow()

            return