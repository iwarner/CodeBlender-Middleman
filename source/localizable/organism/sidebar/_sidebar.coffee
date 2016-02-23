##
# Sidebar controller
#
# @usage
# require organism/sidebar/_sidebar
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# JS lint
##
'use strict'

##
# Class to handle the loading, validation and set up of the JSON
##
class loadFile

    ##
    # Request success
    # Apply request object
    ##
    success = ->
        @callback.apply @

    ##
    # Request error
    ##
    error = ->
         console.error @statusText

    ##
    # Get file - could be JSON or XML perhaps
    #
    getFile : ( url, callback ) ->

        # In production would check XMLHttpRequest requests across browsers
        xhr = new XMLHttpRequest()

        # Callback
        xhr.callback = callback

        # Success
        xhr.onload = success

        # Error
        xhr.onerror = error

        # Asynchronous request
        xhr.open 'GET', url, true

        # Send request
        xhr.send null

        return

##
#
##
class menu

    ##
    #
    ##
    constructor : ->

        # Instantiate file class
        file = new loadFile()

        # Get menu json file
        file.getFile '/assets/javascripts/data/menu.json', @create

        return

    ##
    # Create menu
    ##
    create : ->

        # Parse response to JSON
        json = JSON.parse @responseText

        # Iterate through the Menu
        for key, value of json.menu

            # Check for subMenu
            subMenu = value.menu != null ? true : false

            # Create top level
            pointer = createTopLevel value.id, value.description, value.cssClass, subMenu

            # Check for submenu - we expect null for menu if not present
            if subMenu

                # UL
                ul           = document.createElement "ul"
                ul.className = "drop-menu"

                for k, v of value.menu
                    createSubMenu ul, v.id, v.description, v.cssClass

                # Append to parent
                pointer.appendChild ul

        # Handle clicks on items
        handleClick()

        return

    ##
    # Handle the click on the menu that has a subMenu
    ##
    handleClick = ->

        # Create handler for items that have an icon
        dropdown = document.querySelectorAll '#mainMenu .drop a:not( ".icon-arrow" )'
        console.log dropdown

        # Create handler for items that have an icon
        dropdown = document.querySelectorAll '#mainMenu .drop a i'

        # Iterate the dropdown items
        [].forEach.call dropdown, ( menu ) ->

            subMenu = menu.parentNode.nextSibling
            arrow   = menu

            menu.parentNode.onclick = ( event ) ->

                # Expand the menu
                if ! subMenu.classList.contains 'show'
                    subMenu.classList.add    'show'
                    subMenu.classList.remove 'vanish'
                    arrow.classList.add      'open'
                    arrow.classList.remove   'shut'
                    event.preventDefault()
                else
                    subMenu.classList.remove 'show'
                    subMenu.classList.add    'vanish'
                    arrow.classList.remove   'open'
                    arrow.classList.add      'shut'
                    event.preventDefault()
                return

            return

        return

    ##
    # Create top level of the menu
    ##
    createTopLevel = ( id, text, css, subMenu ) ->

        # List
        li           = document.createElement "li"
        li.className = "drop " + css
        li.id        = id

        # A
        a            = document.createElement "a"
        a.setAttribute 'href', "javascript:;"
        a.setAttribute 'data-toggle', "drop"
        li.appendChild a

        # Icon
        if subMenu
            i            = document.createElement "i"
            i.className  = "icon-arrow";
            a.appendChild i

        # Content
        content      = document.createTextNode text
        a.appendChild content

        # Append
        document.getElementById( "mainMenu" ).appendChild li

    ##
    # Create sub menu
    ##
    createSubMenu = ( pointer, id, text, css ) ->

        # List
        li           = document.createElement "li"
        li.className = css
        li.id        = id

        # A
        a            = document.createElement "a"
        a.setAttribute 'href', "javascript:;"
        li.appendChild a

        # Content
        content      = document.createTextNode text
        a.appendChild content

        # Append
        pointer.appendChild li

        return

##
# Instantiate menu class
##
elite = new menu()