##
# Player
# Each Fixture has scope to record players names for goals and cards
#
# Methods to access players from the Fixtures.csv - corelate goals and cards for
# each.
#
# Totals should be kept for the different competitions - i.e. League & Cup.
#
# @author Ian Warner <ian.warner@drykiss.com>
#
# @todo Correlate the player stats - Method to get the bad boy players yellow and red cards - yellow = 1 point - Red = 3.
# @todo Group by division, season, team as per most methods.
##

##
# Player
##
module Player

    # Extend Core Football
    extend Football

    ##
    # Return players for the season, division or team with correlated stats
    # Parse the names of the players in the following fields scorers a, scorers b,
    # yellow cards a, yellow cards b, red cards a, red cards b cumulate the
    # totals and sub-totals in an array
    #
    # @return array
    ##
    def self.table( season, division, team )

        playerStats[ season ][ division ][ team ]

    end

    ##
    # Read the Fixtures CSV and tallys the statistics
    # Return an array keyed by refs name indicating total yellow, total red and overall points.
    #
    # @return array
    ##
    def self.playerStats

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

        # Return the array
        return stats

    end

    ##
    # Get a list of this players honour
    #
    # @return array Array of the players honours, won league, cup, golden boot, bad boy etc
    ##
    def self.honours

        # Return
        return honours

    end

end