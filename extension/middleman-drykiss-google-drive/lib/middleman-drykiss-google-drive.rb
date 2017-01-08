##
# Google Drive
##

# Require
require "middleman-core"

# Register
Middleman::Extensions.register( :drykiss_google_drive ) do

    require "middleman-drykiss-google-drive/extension"
    ::Middleman::DryKISSGoogleDrive

end
