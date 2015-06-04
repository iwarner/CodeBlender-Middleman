##
# Icon Helper
#
# Usage
# icon( "fa-phone extraClass" )
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
        if iconName =~ /^icon-|^fa-|^glyphicon-/i
            result = Haml::Engine.new( "%span{ class: \"#{ iconLibrary[ 0 ] } #{ iconName } fa-fw\" }" )
        else
            result = Haml::Engine.new( iconName )
        end

        result.render

    end

    ##
    # Stacked Icon
    # Currently works with Font Awesome
    #
    # @see http://fortawesome.github.io/Font-Awesome/examples/#stacked
    ##
    def stacked( iconName, size )

        capture_haml do

            haml_tag :span, :class => "fa-stack #{ size }" do

                haml_concat icon( "fa-circle-thin fa-stack-2x" )
                haml_concat icon( iconName )

            end

        end

    end

end