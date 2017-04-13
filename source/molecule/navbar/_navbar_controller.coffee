##
# Navigation
#
# @author Ian Warner <ian.warner@drykiss.com>
##
# class App.Views.Navigation extends Backbone.View

#     ##
#     # Initialize
#     ##
#     render : ->

#         # Elements
#         el = $ "#navbar"

#         # Affix Offset
#         el.affix offset :
#             top : 71

#         # Affix event
#         el.on "affix.bs.affix", ( data ) ->
#             $( ".navAbove" ).css "margin-top", "71px"

#         # Affix Top event
#         el.on "affix-top.bs.affix", ( data ) ->
#             $( ".navAbove" ).css "margin-top", "20px"

# ##
# # Scroll Spy
# #
# # @author Ian Warner <ian.warner@drykiss.com>
# ##
# class App.Utils.ScrollSpy

#     ##
#     # Constructor
#     ##
#     constructor : ->

#         # Nav Scroll Spy
#         $( "#navbar" ).on "activate.bs.scrollspy", ( event ) =>

#             hash    = $( "#navbar .navbar-nav > .active a" ).attr "href"
#             $hashEl = $ hash

#             # Add Link to the disabled links if any
#             # @addLink( hash )

#             # Remove the Hash ID from the element on the page - to stop the browser from jumping to it
#             if $hashEl.length
#                 $hashEl.attr "id", ""

#             # Check hash exists
#             if hash != undefined

#                 # Add the new URL to Backbone's history and update the URL
#                 Backbone.history.navigate hash,
#                     trigger : true

#             # Put the Hash ID back
#             if $hashEl.length
#                 $hashEl.attr "id", Backbone.history.fragment

#             # Remove Link
#             # @removeLink( hash )

#             # Debug
#             # log.info hash, $hashEl, Backbone.history.fragment

#     ##
#     # Add link back to other Nav elements
#     ##
#     addLink : ( hash ) ->

#         # Loop through the sections
#         $( ".navbar a" ).each ( i ) ->

#             el = $( @ )

#             if el.attr( "disabled" )

#                 # Debug
#                 # log.info i, el

#                 # Remove Disabled and Add in HREF again
#                 el.removeAttr( "disabled" ).attr( "href", el.attr( "class" ) ).removeAttr( "class" )

#     ##
#     # Remove the link from the navbar element
#     ##
#     removeLink : ( hash ) ->

#         # Remove Href Add Class Disabled
#         $( ".navbar-nav > .active a" ).removeAttr( "href" ).attr( "disabled", "disabled" ).addClass( hash )

# # Instantiate Utility
# new App.Utils.ScrollSpy
