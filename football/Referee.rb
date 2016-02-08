##
# Referee
#
# Compile the Referees used - get past matches and fixtures
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# Referee
##
module Referee

    # Extend Core Football
    extend Football

    ##
    # Returns an array of the referees used in the season
    #
    # @return array Tabular tally of ref stats for the season
    # @todo   Sort these stats by points - yellow = 1 - red = 3
    ##
    def self.table( season )
        refStats = processStats[ season ]
    end

    ##
    # Read the Fixtures CSV and tallys the statistics
    # Return an array keyed by refs name indicating total yellow, total red and overall points.
    #
    # @return array
    ##
    def self.refStats

        # Create a new Table Hash
        stats = Hash.new

        # Loop through the CSV
        CSV.foreach( Football::FIXTURES_CSV, headers: true ) do | row |

            # Assign to Variables
            season  = row[ 0 ].strip.to_i
            # competition
            # cup
            # date
            # time
            # referee
            # ground
            # teamA
            # scoreB
            # teamB
            # scoreB
            # scorersA
            # scorersB
            yellowA = row[ 13 ].strip
            yellowB = row[ 14 ].strip
            redA    = row[ 15 ].strip
            redB    = row[ 16 ].strip
            # penaltiesA
            # penaltiesB

        end

        # Return the Table array
        return stats

    end

end