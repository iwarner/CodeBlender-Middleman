##
# Local Storage Abstraction
#
# http://dev.w3.org/html5/webstorage/
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
# @todo Sort out the check method internally - in constructor
# @todo Sort out the Clear key method
##
class App.Classes.LocalStorage

    ##
    # Constructor
    ##

    ##
    # Check
    ##
    check :  ->

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
    getItem : ( name ) ->

        # Retrieve the object from storage
        JSON.parse( localStorage.getItem name )

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
    # Remove Item
    ##
    removeItem : ( name ) ->

        # Remove item from storage
        localStorage.removeItem name

    ##
    # Clear
    ##
    clear : ->
