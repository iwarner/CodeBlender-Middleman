##
# Cup
# Methods to compile cup fixtures and results
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# Cup
##
module Cup

    # Extend Core Football
    extend Football

    ##
    # Returns an array for all the cup games in a season in the Fixtures CSV
    #
    # @return array Array of cup games
    ##
    def self.cup( season )

        cupFixtures = processFixtures[ season ]

        # Sort by date

    end

    ##
    # Read the Fixtures CSV and associates tallys the statistics
    #
    # @return array Returns all fixtures in { season_id => { division => { teama => {}, teamb => {} } } format
    ##
    def self.processFixtures

        # Create a new Table Hash
        cup = Hash.new

        # Loop through the CSV
        CSV.foreach( Football::FIXTURES_CSV, headers: true ) do | row |

            # Assign to Variables
            season     = row[ 0 ].strip.to_i
            division   = row[ 1 ].strip.to_i
            cup        = row[ 2 ].strip.to_i
            # date
            # time
            # referee
            # ground
            teamA      = row[ 7 ].strip
            scoreA     = row[ 8 ].to_i
            teamB      = row[ 9 ].strip
            scoreB     = row[ 10 ].to_i
            # scorersA
            # scorersB
            # yellowA  = row[ 13 ].strip
            # yellowB  = row[ 14 ].strip
            # redA     = row[ 15 ].strip
            # redB     = row[ 16 ].strip
            penaltiesA = row[ 17 ].strip
            penaltiesB = row[ 18 ].strip

            # Create Cup Array

        end

        # Return the Table array
        return cup

    end

    ##
    # Get a list of the previous winners of the cup competitions
    #
    # @param int Optional Season value - if null then return all seasons
    ##
    def self.honours( season )

        # Process the Fixtures and get the winners for each season

        # Return Array or Teams for the season
        return winners

    end

end