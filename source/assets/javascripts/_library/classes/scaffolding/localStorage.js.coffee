##
# Local Storage Abstraction
#
# Methods
# key        : Returns the name of the key at the position specified.
#              var keyName = window.localStorage.key(0);
# getItem    : Returns the item identified by it's key.
#              var value = window.localStorage.getItem("key");
# setItem    : Saves and item at the key provided.
#              window.localStorage.setItem("key", "value");
# removeItem : Removes the item identified by it's key.
#              window.localStorage.removeItem("key");
# clear      : Removes all of the key value pairs.
#              window.localStorage.clear();
#
# Include events in this class
# key         : the property that has changed
# newValue    : the newly set value
# oldValue    :  previously stored  value
# url         : the full url path from where the event originated
# storageArea :  localStorage or sessionStorage object
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Classes.LocalStorage

    ##
    # Check
    ##
    check : ->

        # Check that local storage exists
        false unless "localStorage" of window and window[ "localStorage" ] isnt null

    ##
    # Set Item
    ##
    count : ->

        localStorage.length

    ##
    # Key
    ##
    key : ->

        log.info "Key"

    ##
    # Set Item
    #
    # Usage
    # local.setItem "test", "Here"
    #
    # @param string name
    # @param object object
    ##
    setItem : ( name, object ) ->

        # Catch Storage Limitation Error
        try

            # Put the object into storage
            localStorage.setItem name, JSON.stringify( object )

        catch e

            log.info e.message
            log.info "Quota exceeded!" if e is QUOTA_EXCEEDED_ERR

    ##
    # Get Item
    ##
    getItem : ( name, parse = false ) ->

        # Retrieve the object from storage
        item = localStorage.getItem name

        if parse
            item = JSON.parse( item )

        item

    ##
    # Get Items
    ##
    getItems : ->

        i   = 0
        len = @count()

        # Loop through the local storage
        while i < len

            key   = localStorage.key(i)
            value = localStorage.getItem(key)

            arrStorageItems.push
                key: key
                value: value

            i++

    ##
    # Download Item
    ##
    downloadItem : ( name ) ->

        item = @getItem name, false

        # Base64 Items
        base64 = window.btoa item

        # Create a downlaod Link
        uri = "data:application/octet-stream;base64," + base64;
        window.open uri

        # Debug
        # log.info el
        # log.info item
        # log.info base64

        return

    ##
    # Remove Item
    ##
    removeItem : ( name ) ->

        # Remove item from storage
        localStorage.removeItem name

    ##
    # Clear
    ##
    clear : ->
