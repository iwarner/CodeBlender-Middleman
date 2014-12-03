##
# Grvatar Avatar
#
# Usage
# -# Gravatar
# = Gravtar( "email@domain.com" )
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# Gravatar Module
#
# @param email String User's email address
# @param size  String Size of image - default 80px square
##
module Gravatar

    def avatar( email, size = "80", protocol = "https" )

        if email

            # Make md5 hash for email address
            hash = Digest::MD5.hexdigest( email.chomp.downcase )

            # Return url for Gravatar image
            "#{ protocol }://www.gravatar.com/avatar/#{ hash }.jpg?s=#{ size }&r=pg"

        else

            # Return default image
            "#{ protocol }://www.gravatar.com/avatar/?d=mm"

        end

    end

end