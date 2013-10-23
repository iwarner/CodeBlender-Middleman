##
#
##
class TagCloud

    cattr_accessor :defaultOptions

    self.defaultOptions = {
        :sizeMin   => 70,
        :sizeMax   => 170,
        :precision => 0,
        :unit      => '%',
        :threshold => 1
    }

    attr_reader :options

    ##
    #
    ##
    def initialize( options = {} )
        @options = defaultOptions.update( options )
    end

    ##
    #
    ##
    def render( tags )

        tags_weight( tags_count( tags ) ).each do | tag_pair |

            tag, weight = tag_pair
            size        = sprintf( "%.#{options[:precision]}f", calculateSize( weight ) )

            yield( tag, size, options[:unit] )

        end

    end

    private

    ##
    #
    ##
    def tags_count( tags )

        tags.map do | tag, articles |

            [tag, articles.count] if articles.count >= options[:threshold]

        end.compact

    end

    ##
    #
    ##
    def tags_weight( count )

        # get the minimum, and maximum tag count
        min, max = count.map(&:last).minmax

        # map: [[tag, tag count]] -> [[tag, tag weight]]
        count.map do | tag, count |

            # Logarithmic distribution
            weight = ( Math.log( count ) - Math.log( min ) ) / ( Math.log( max ) - Math.log( min ) )

            [tag, weight]

        end

    end

    ##
    # Calculate the weight for the Tag
    ##
    def calculateSize( weight )
        options[:sizeMin] + ( ( options[:sizeMax] - options[:sizeMin] ) * weight).to_f
    end

end