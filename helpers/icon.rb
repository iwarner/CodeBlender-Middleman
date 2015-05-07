##
# Icon Helper
#
# Usage
# icon "iconName"
#
# @author Ian Warner <ian.warner@drykiss.com>
##
module Icon

    ##
    # Which Icon library to use if any.
    #
    # @todo Option for the Fixed Width? Also just for font-awesome
    ##
    def icon( iconName )

        # Find out Icon Library
        iconName    = string iconName
        iconLibrary = iconName.partition( "-" )

        # Check whether this is an icon
        if iconName =~ /icon-|fa-|glyphicon-/i
            result = Haml::Engine.new( "%span{ class: \"#{ iconLibrary[ 0 ] } #{ iconName } fa-fw\" }" )
        else
            result = Haml::Engine.new( iconName )
        end

        result.render

    end

end