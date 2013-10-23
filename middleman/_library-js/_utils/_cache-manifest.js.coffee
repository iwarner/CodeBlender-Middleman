##
# Cache Manifest Checking
##
class App.Utils.CacheManifest

    ##
    # Constructor
    ##
    constructor : ->

    logEvent = ( e ) ->

        online  = undefined
        status  = undefined
        type    = undefined
        message = undefined
        online  = ( if ( navigator.onLine ) then "yes" else "no" )
        status  = cacheStatusValues[ cache.status ]
        type    = e.type

        message  = "online: " + online
        message += ", event: " + type
        message += ", status: " + status
        message += " (Maybe a syntax error in manifest)"  if type is "error" and navigator.onLine

    cacheStatusValues    = []
    cacheStatusValues[0] = "uncached"
    cacheStatusValues[1] = "idle"
    cacheStatusValues[2] = "checking"
    cacheStatusValues[3] = "downloading"
    cacheStatusValues[4] = "updateready"
    cacheStatusValues[5] = "obsolete"

    cache = window.applicationCache

    cache.addEventListener "cached", logEvent, false
    cache.addEventListener "checking", logEvent, false
    cache.addEventListener "downloading", logEvent, false
    cache.addEventListener "error", logEvent, false
    cache.addEventListener "noupdate", logEvent, false
    cache.addEventListener "obsolete", logEvent, false
    cache.addEventListener "progress", logEvent, false
    cache.addEventListener "updateready", logEvent, false

    window.applicationCache.addEventListener "updateready", ( ->
        window.applicationCache.swapCache()
        log.info "swap cache has been called"
), false
setInterval (->
  cache.update()
), 10000



:javascript

    var cacheStatusValues = [];
    cacheStatusValues[0] = 'uncached';
    cacheStatusValues[1] = 'idle';
    cacheStatusValues[2] = 'checking';
    cacheStatusValues[3] = 'downloading';
    cacheStatusValues[4] = 'updateready';
    cacheStatusValues[5] = 'obsolete';

    var cache = window.applicationCache;
    cache.addEventListener('cached', logEvent, false);
    cache.addEventListener('checking', logEvent, false);
    cache.addEventListener('downloading', logEvent, false);
    cache.addEventListener('error', logEvent, false);
    cache.addEventListener('noupdate', logEvent, false);
    cache.addEventListener('obsolete', logEvent, false);
    cache.addEventListener('progress', logEvent, false);
    cache.addEventListener('updateready', logEvent, false);

    function logEvent(e) {
        var online, status, type, message;
        online = (navigator.onLine) ? 'yes' : 'no';
        status = cacheStatusValues[cache.status];
        type = e.type;
        message = 'online: ' + online;
        message+= ', event: ' + type;
        message+= ', status: ' + status;
        if (type == 'error' && navigator.onLine) {
            message+= ' (prolly a syntax error in manifest)';
        }
        $( '.console' ).text(message);
    }

    window.applicationCache.addEventListener(
        'updateready',
        function(){
            window.applicationCache.swapCache();
            $( '.console' ).text('swap cache has been called');
        },
        false
    );

    setInterval(function(){cache.update()}, 10000);