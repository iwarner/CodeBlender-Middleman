##
# Core Extensions
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# Hash
##
class Hash

    def except( which )
        self.tap{ | h | h.delete( which ) }
    end

end

##
# Object
##
class Object

    # From rails/Object/try
    def try( *a, &b )

        if a.empty? && block_given?
            yield self

        else
            public_send( *a, &b ) if respond_to?( a.first )
        end

    end

end
