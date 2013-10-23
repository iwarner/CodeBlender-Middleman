##
# EVE Online
#
# new App.Classes.EveOnline()
##
class App.Classes.EveOnline

    # EVE API Path
    api = "https://api.eveonline.com/"

    # YQL Proxy
    # http://developer.yahoo.com/yql/console/
    yql = "https://query.yahooapis.com/v1/public/yql"

    # account, corp etc
    scope = ""

    ##
    # Misc Server Status
    # https://wiki.eveonline.com/en/wiki/EVE_API_Misc_Server_Status
    ##
    accountAccountStatus : ( callback, keyID, apiKey ) ->

        @node = "account/AccountStatus"
        @sendRequest( callback, keyID, apiKey )

    ##
    # Misc Server Status
    # https://wiki.eveonline.com/en/wiki/EVE_API_Account_Characters
    ##
    accountCharacters : ( callback, keyID, apiKey ) ->

        @node = "account/Characters"
        @sendRequest( callback, keyID, apiKey )

    ##
    # Misc Server Status
    # https://wiki.eveonline.com/en/wiki/EVE_API_Misc_Server_Status
    ##
    miscServerStatus : ( callback ) ->

        node = "server/ServerStatus"

        # POST AJAX
        $.post yql,
            q      : "SELECT * FROM xml WHERE url=\"" + api + node + ".xml.aspx" + "\""
            format : "json"
        .done ( data ) ->

            res = data.query.results.eveapi

            # Process the returned data
            ret = []
            ret[ "time" ]    = res.currentTime
            ret[ "open" ]    = res.result.serverOpen
            ret[ "players" ] = res.result.onlinePlayers

            # Process the callback
            callback ret

        .fail ( data )->
            log.info "Fail"
            log.info data

        .always ->
            true

    ##
    # Send Request
    ##
    sendRequest : ( callback, keyID, apiKey) ->

        $.post yql,
            q      : "SELECT * FROM xml WHERE url=\"" + api + @node + ".xml.aspx?keyID=" + keyID + "&vCode=" + apiKey + "\""
            format : "json"
        .done ( data ) ->

            # Process the callback
            callback keyID, apiKey, data.query.results.eveapi

        .fail ( data ) ->
            log.info "Fail"
            log.info data

        .always ->
            true