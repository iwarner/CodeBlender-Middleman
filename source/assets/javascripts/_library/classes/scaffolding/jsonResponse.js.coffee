##
# JSON Response
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Classes.JsonResponse

    ##
    # JSON Codes
    ##
    codes : ( code ) ->

        jsonCodes        = []
        jsonCodes[ 400 ] = "Unrecognized command"
        jsonCodes[ 401 ] = "Permission denied"
        jsonCodes[ 402 ] = "Missing argument"
        jsonCodes[ 401 ] = "Incorrect password"
        jsonCodes[ 404 ] = "Account not found"
        jsonCodes[ 405 ] = "Email not validated"
        jsonCodes[ 408 ] = "Token expired"
        jsonCodes[ 411 ] = "Insufficient privileges"
        jsonCodes[ 500 ] = "Internal server error"
        jsonCodes[ code ]