##
# Globalization Class
# Obtains information and performs operations specific to the user's locale and timezone.
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.PhoneGap.Globalization

    ##
    # Get Preferred Language
    ##
    language : ->

        navigator.globalization.getPreferredLanguage( @success, @error )

    ##
    # Get Locale Name
    ##
    locale : ->

        navigator.globalization.getLocaleName( @success, @error )

    ##
    # Date To String
    ##
    dateString : ->

        options = {
            formatLength :'short',
            selector     : 'date and time'
        }

        navigator.globalization.dateToString ( date, @success, @error, options )

    ##
    # String To Date
    ##
    stringDate : ->

    ##
    # Date Pattern
    ##
    datePattern : ->

    ##
    # Date Names
    ##
    dateNames : ->

    ##
    # Daylight Savings Time
    ##
    daylightsavings : ->

    ##
    # Get First Day of the Week
    ##
    dayWeek : ->

    ##
    # Number to String
    ##
    numberString : ->

    ##
    # String to Number
    ##
    stringNumber : ->

    ##
    # Number Pattern
    ##
    numberPattern : ->

    ##
    # Get Currency Pattern
    ##
    currencyPattern : ->

    ##
    # Success
    ##
    success : ( result ) ->

        # Debug
        log.info "onSuccess - Geo", result

    ##
    # Error
    ##
    error : ( error ) ->

        # Debug
        log.info 'Error code: ' + error.code + '\n' + 'Error message: ' + error.message + '\n'