##
# Fixture
#
# Methods to access the fixtures and results direct from the Fixtures.csv
#
# @usage
# puts Fixture.teamFixture(11, 1, 'Tokyo Hibernian FC')
#
# @author Ian Warner <ian.warner@drykiss.com>
#
# @todo Currently this does not work and needs a re-write to just return the correct fixtures required
# @todo Data Time normalisation
# @todo Delimit and group fixtures by season, division, team and type or combination of these
# @todo i.e. for Team Need to get all the fixtures for a corresponding team in a season.
# @todo Type is cup, league or plate
# @todo Current Season - will be the max(season)
# @todo Unplayed games - these will be ones where scores are not updated
# @todo Ground should do a lookup
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
    def self.fixture( season, competition, team = nil, type = nil, unplayed = nil )

        puts season
        puts competition

        fixtures = processFixtures[ season ][ competition ]

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
    def self.teamFixture( season, competition, team = nil, type = nil, unplayed = nil )
       processFixtures[ season ][ competition ][ team ]
    end

    ##
    # Read the Fixtures CSV and simply return the rows in an array with some columns
    # normalised
    #
    # @return array Returns all fixtures in { season_id => { competition => { teama => {}, teamb => {} } } format
    ##
    def self.processFixtures

        # Create a new Table Hash
        fixtures = Hash.new

        # Loop through the CSV
        CSV.foreach( Football::FIXTURES_CSV, headers: true ) do | row |

            puts row

            # Limit the fixtures by season, competition team and type.

            # Use the Type to exclude certain fixtures
            unless row[ 2 ].to_i == 1

                # Assign to Variables
                season      = row[ 'season' ].strip.to_i
                competition = row[ 'competition' ].strip.to_i
                # cup         = row[ 'cup' ].strip.to_i
                # date        = row[ 'date' ].strip
                # time        = row[ 'time' ].strip
                # referee     = row[ 'referee' ].strip
                # ground      = row[ 'ground' ].strip

                teamA       = row[ 'team a' ].strip
                scoreA      = row[ 'score a' ].strip.to_i
                teamB       = row[ 'team b' ].strip
                scoreB      = row[ 'score b' ].strip.to_i
                # scorerA     = row[ 'scorer a' ].strip
                # scorerB     = row[ 'scorer b' ].strip

                # yellowA     = row[ 'yellow a' ].strip
                # yellowB     = row[ 'yellow b' ].strip
                # redA        = row[ 'red a' ].strip
                # redB        = row[ 'red b' ].strip
                # penaltyA    = row[ 'penalty a' ].strip
                # penaltyB    = row[ 'penalty b' ].strip

                # Correlate the fixtures
                divisionResults                   =  initiateSeasonDivision( fixtures, season, competition )
                insertTeam( divisionResults, teamA )
                insertTeam( divisionResults, teamB )

                updateTeamStats( divisionResults[ teamA ], scoreA,  scoreB )
                updateTeamStats( divisionResults[ teamB ], scoreB,  scoreA )

            end

        end

        # addTeams( fixtures )

        # Return the Fixtures array - this will return everything in a normalised way
        # return fixtures

    end

    ##
    # Date and Time - normalise the returned event time
    #
    # @return array Returns all fixtures in { season_id => { competition => { teama => {}, teamb => {} } } format
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