##
# Matrix
# Methods to create a matrix of the results
#
# @usage
# -# Matrix
# = matrix = Matrix.matrix( 11, 1 )
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# Matrix
##
module Matrix

    # Extend Core Football
    extend Football

    ##
    # Returns division fixtures in { teama => {}, teamb => {} } format
    #
    # @return array
    ##
    def self.matrix( season, division )
        processFixtures[ season ][ division ]
    end

    ##
    # Returns results in { season_id => { division => { teama => { teamb => { f: 4, a: 5 } } } format
    ##
    def self.processFixtures

        # New Hash
        matrix = {}

        CSV.foreach( Football::FIXTURES_CSV, headers: true ) do | row |

            # Exclude cup
            unless row[ 2 ].to_i == 1

                season   = row[ 0 ].to_i
                division = row[ 1 ].to_i
                teamA    = row[ 7 ]
                scoreA   = row[ 8 ]
                teamB    = row[ 9 ]
                scoreB   = row[ 10 ]

                divisionResults                   =  initiateSeasonDivision( matrix, season, division )
                divisionResults[ teamA ]          = {} unless divisionResults.keys.include?( teamA )
                divisionResults[ teamA ][ teamB ] = { f: scoreA, a: scoreB }

            end

        end

        # Add teams that may not already appear in the results yet
        addTeams( matrix )

        # Return the Matrix array
        return matrix

    end

end