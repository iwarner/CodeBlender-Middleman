##
# Fixture
#
# Methods to access the fixtures and results direct from the Fixtures.csv
#
# @author Ian Warner <ian.warner@drykiss.com>
#
# @todo   Data Time normalisation
# @todo   Delimit and group fixtures by season, division, team and type or combination of these
# @todo   i.e. for Team Need to get all the fixtures for a corresponding team in a season.
# @todo   Type is cup, league or plate
# @todo   Current Season - will be the max(season)
# @todo   Unplayed games - these will be ones where scores are not updated
##

##
# Fixture
##
module Fixture

    # Extend Core Football
    extend Football

    ##
    # Returns an hash for all the fixtures
    #
    # @param  int    Season Identifier
    # @param  int    Division Identifier
    # @param  string Team Identifier
    # @param  string Type Identifier - cup, plate, league, unplayed
    # @return hash   Hash of fixtures
    ##
    def self.fixture( season, division, team = nil, type = nil, unplayed = nil )

        fixtures = processFixtures[ season ][ division ]

        # Sort by date
        fixtures.sort_by{ | teamName, stats | [ stats[ :pts ] * -1, stats[ :gd ] * -1, teamName ] }

    end

    ##
    # Returns an array for fixtures belongs to a Team
    #
    # @param  int    Season Identifier
    # @param  int    Division Identifier
    # @param  string Team Identifier
    # @param  string Type Identifier - cup, plate, league, unplayed
    # @return array  Array of fixtures
    ##
    def self.teamFixture( season, division, team = nil, type = nil, unplayed = nil )

       processFixtures[ season ][ division ][ team ]

    end

    ##
    # Read the Fixtures CSV and simply return the rows in an array with some columns
    # normalised
    #
    # @return array Returns all fixtures in { season_id => { division => { teama => {}, teamb => {} } } format
    ##
    def self.processFixtures

        # Create a new Table Hash
        fixtures = Hash.new

        # Loop through the CSV
        CSV.foreach( Football::FIXTURES_CSV, headers: true ) do | row |

            # Limit the fixtures by season, division team and type.

            # Use the Type to exclude certain fixtures
            unless row[ 2 ].to_i == 1

                # Assign to Variables
                season     = row[ 'season' ].strip.to_i
                division   = row[ 'competition' ].strip.to_i
                #cup        = row[ 'cup' ].strip.to_i
                # date
                # time
                # referee
                # ground
                teamA      = row[ 'team a' ].strip
                scoreA     = row[ 'score a' ].to_i
                teamB      = row[ 'team b' ].strip
                scoreB     = row[ 'score b' ].to_i
                # scorersA
                # scorersB
                # yellowA  = row[ 13 ].strip
                # yellowB  = row[ 14 ].strip
                # redA     = row[ 15 ].strip
                # redB     = row[ 16 ].strip
                penaltiesA = row[ 'penalties a' ].try( :strip )
                penaltiesB = row[ 'penalties b' ].try( :strip )

                # Correlate the fixtures
                divisionResults                   =  initiateSeasonDivision( fixtures, season, division )
                insertTeam( divisionResults, teamA )
                insertTeam( divisionResults, teamB )

                updateTeamStats( divisionResults[ teamA ], scoreA,  scoreB )
                updateTeamStats( divisionResults[ teamB ], scoreB,  scoreA )
            end

        end

        addTeams( fixtures )

        # Return the Fixtures array - this will return everything in a normalised way
        return fixtures

    end

    ##
    # Date and Time - normalise the returned event time
    #
    # @return array Returns all fixtures in { season_id => { division => { teama => {}, teamb => {} } } format
    ##
    def self.dateTime( date, time )

        # From 2010-10-01 17:10
        # return Aug 18th @ 17:50

    end

    ##
    # Creates base hash for a team
    ##
    def self.insertTeam( divisionResults, team )

        unless divisionResults.keys.include?( team )
            divisionResults[ team ] = { p: 0, w: 0, d: 0, l: 0, f: 0, a: 0, gd: 0, pts: 0 }
        end

    end

    ##
    # Inserts stats of a team
    ##
    def self.updateTeamStats( team, forGoals, againstGoals )

        # Games Played
        team[ :p ] += 1

        # For Goals
        team[ :f ] += forGoals

        # Away Goals
        team[ :a ] += againstGoals

        # Goal Difference
        team[ :gd ] = team[ :f ] - team[ :a ]

        # Win
        if forGoals > againstGoals
            team[ :w ]   += 1
            team[ :pts ] += Football::WIN_POINTS

        # Loss
        elsif forGoals < againstGoals
            team[ :l ] += 1

        # Draw
        else
            team[ :d ]   += 1
            team[ :pts ] += Football::DRAW_POINTS
        end

    end

end

puts "pppppppppppppppppppppp #{Fixture.teamFixture(11, 1,  'Tokyo Hibernian FC')}"
