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
# Menu class
# Create the menu structure from a loaded JSON object
##
class menu

    ##
    # Constructor
    # Makes sure we always load the menu JSON
    ##
    constructor : ->

        # Instantiate file class
        file = new loadFile()

        # Get menu json file
        file.getFile '/javascripts/data/menu.json', @create

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
            pointer = createTopLevel value.id, value.description, value.content, value.cssClass, subMenu

            # Check for submenu - we expect null for menu if not present
            if subMenu

                # UL
                ul           = document.createElement "ul"
                ul.className = "drop-menu"

                for k, v of value.menu
                    createSubMenu ul, v.id, v.description, v.content, v.cssClass

                # Append to parent
                pointer.appendChild ul

        # Handle clicks on items
        handleClick()

        return

    ##
    # Handle updating the page with the correct content
    ##
    handlePageUpdate = ( event ) ->

        # Update
        document.getElementById( "sidebar__content" ).innerHTML = event.target.dataset.content
        return

    ##
    # Handle the click on the menu that has a subMenu
    ##
    handleClick = ->

        # Create handler for A tags
        dropdown = document.querySelectorAll '#mainMenu .drop a'

        # Iterate the A tags
        [].forEach.call dropdown, ( menu ) ->

            subMenu = menu.nextSibling
            arrow   = menu.querySelector 'i.icon-arrow:first-child'

            # Click event for all A tags
            menu.onclick = ( event ) ->

                # Check for dropdown
                if this.querySelector "a i"

                    # Expand the menu
                    if ! subMenu.classList.contains 'show'
                        subMenu.classList.add    'show'
                        subMenu.classList.remove 'vanish'
                        arrow.classList.add      'open'
                        arrow.classList.remove   'shut'
                        event.preventDefault()
                        return
                    else
                        subMenu.classList.remove 'show'
                        subMenu.classList.add    'vanish'
                        arrow.classList.remove   'open'
                        arrow.classList.add      'shut'
                        event.preventDefault()
                        return
                    return

                # Update page with content
                else
                    handlePageUpdate( event )
                    return

            return

        return

    ##
    # Create top level of the menu
    ##
    createTopLevel = ( id, text, content, css, subMenu ) ->

        # List
        li           = document.createElement "li"
        li.className = "drop " + css
        li.id        = id

        # A
        a            = document.createElement "a"
        a.setAttribute 'href', "javascript:;"
        a.setAttribute 'data-toggle', "drop"
        a.setAttribute 'data-content', content
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
    createSubMenu = ( pointer, id, text, content, css ) ->

        # List
        li           = document.createElement "li"
        li.className = css
        li.id        = id

        # A
        a            = document.createElement "a"
        a.setAttribute 'href', "javascript:;"
        a.setAttribute 'data-content', content
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
if window.location.pathname == "/organism/sidebar/sidebar.html"
    elite = new menu()