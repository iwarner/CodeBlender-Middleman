##
# Card
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Drive extends Backbone.View

    # CLIENT_ID = "908346284125-9nc8k5avs5gsg4f53j058jotsedtodgc.apps.googleusercontent.com"
    # SCOPES    = 'https://www.googleapis.com/auth/drive'

    # ##
    # # Called when the client library is loaded to start the auth flow.
    # ##
    # handleClientLoad = ->
    #     window.setTimeout checkAuth, 1
    #     return

    # ##
    # # Check if the current user has authorized the application.
    # ##
    # checkAuth = ->
    #     gapi.auth.authorize {
    #         'client_id' : CLIENT_ID
    #         'scope'     : SCOPES
    #         'immediate' : true
    #     }, handleAuthResult

    #     return

    # ###*
    # # Called when authorization server replies.
    # #
    # # @param {Object} authResult Authorization result.
    # ###
    # handleAuthResult = (authResult) ->
    #     authButton = document.getElementById('authorizeButton')
    #     filePicker = document.getElementById('filePicker')
    #     authButton.style.display = 'none'
    #     filePicker.style.display = 'none'
    #     if authResult and !authResult.error
    #         # Access token has been successfully retrieved, requests can be sent to the API.
    #         filePicker.style.display = 'block'
    #         filePicker.onchange = uploadFile
    #     else
    #         # No access token could be retrieved, show the button to start the authorization flow.
    #         authButton.style.display = 'block'

    #         authButton.onclick = ->
    #             gapi.auth.authorize {
    #                 'client_id': CLIENT_ID
    #                 'scope': SCOPES
    #                 'immediate': false
    #             }, handleAuthResult

    #             return

    #     return

    # ###*
    # # Start the file upload.
    # #
    # # @param {Object} evt Arguments from the file selector.
    # ###
    # uploadFile = (evt) ->
    #     gapi.client.load 'drive', 'v2', ->
    #         file = evt.target.files[0]
    #         insertFile file
    #         return

    #     return

    # ###*
    # # Insert new file.
    # #
    # # @param {File} fileData File object to read data from.
    # # @param {Function} callback Function to call when the request is complete.
    # ###
    # insertFile = (fileData, callback) ->

    #     boundary = '-------314159265358979323846'
    #     delimiter = '\ud\n--' + boundary + '\ud\n'
    #     close_delim = '\ud\n--' + boundary + '--'
    #     reader = new FileReader
    #     reader.readAsBinaryString fileData

    #     reader.onload = (e) ->
    #         contentType = fileData.type or 'application/octet-stream'
    #         metadata =
    #             'title': fileData.name
    #             'mimeType': contentType

    #         base64Data = btoa(reader.result)
    #         multipartRequestBody = delimiter + 'Content-Type: application/json\ud\n\ud\n' + JSON.stringify(metadata) + delimiter + 'Content-Type: ' + contentType + '\ud\n' + 'Content-Transfer-Encoding: base64\ud\n' + '\ud\n' + base64Data + close_delim
    #         request = gapi.client.request(
    #             'path': '/upload/drive/v2/files'
    #             'method': 'POST'
    #             'params': 'uploadType': 'multipart'
    #             'headers': 'Content-Type': 'multipart/mixed; boundary="' + boundary + '"'
    #             'body': multipartRequestBody)

    #         if !callback

    #             callback = (file) ->
    #                 console.log file
    #                 return

    #         request.execute callback
    #         return

    #   return