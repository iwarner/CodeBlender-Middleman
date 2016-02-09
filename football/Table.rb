##
# Table
#
# Methods to compile tables for the league into divisions.
#
# @usage
# -# Table
# = table = Table.table( 11, 1 )
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# Table
##
module Table

    # Extend Core Football
    extend Football

    ##
    # Returns the table array for a single division in a given season
    #
    # @return array Tabular tally of teams statistics for the season and division
    ##
    def self.table( season, division )

        divisonFixtures = processFixtures[ season ][ division ]

        # Sort by Team Name - Statistics : points, goal difference and then team name
        divisonFixtures.sort_by{ | teamName, stats | [ stats[ :pts ] * -1, stats[ :gd ] * -1, teamName ] }

    end

    ##
    # Get a list of the previous winners of the leagues
    #
    # @param int Optional Season value - if null then return all seasons
    ##
    def self.honours( season, division )

        # Process the Fixtures and get the winners for each season

        # Return Array or Teams for the season
        return winners

    end

    ##
    # Read the Fixtures CSV and associates tallys the statistics
    #
    # @return array Returns all fixtures in { season_id => { division => { teama => {}, teamb => {} } } format
    ##
    def self.processFixtures

        # Create a new Table Hash
        table = Hash.new

        # Loop through the CSV
        CSV.foreach( Football::FIXTURES_CSV, headers: true ) do | row |

            # Exclude cup
            unless row[ 2 ].to_i == 1

                # Assign to Variables
                season   = row[ 0 ].strip.to_i
                division = row[ 1 ].strip.to_i
                teamA    = row[ 7 ].strip
                scoreA   = row[ 8 ].to_i
                teamB    = row[ 9 ].strip
                scoreB   = row[ 10 ].to_i

                #
                divisionFixtures = initiateSeasonDivision( table, season, division )

                #
                insertTeamFixtures( divisionFixtures, teamA )
                insertTeamFixtures( divisionFixtures, teamB )

                # Update the statistics
                updateTeamStats( divisionFixtures[ teamA ], scoreA, scoreB )
                updateTeamStats( divisionFixtures[ teamB ], scoreB, scoreA )

                # Update the previous fixtures
                previousGames( divisionFixtures[ teamA ] )
                previousGames( divisionFixtures[ teamB ] )

            end

        end

        # Add teams that may not already appear in the results yet
        addTeams( table )

        # Return the Table array
        return table

    end

    ##
    #
    ##
    def self.insertTeamFixtures( divisionFixtures, team )

        unless divisionFixtures.keys.include?( team )
            divisionFixtures[ team ] = { p: 0, w: 0, d: 0, l: 0, f: 0, a: 0, gd: 0, pts: 0, previousGames: [] }
        end

    end

    ##
    # Update Team Statistics
    ##
    def self.updateTeamStats( team, goalsFor, goalsAgainst )

        # Games Played
        team[ :p ] += 1

        # Goals For
        team[ :f ] += goalsFor

        # Goals Against
        team[ :a ] += goalsAgainst

        # Goal Difference
        team[ :gd ] = team[ :f ] - team[ :a ]

        # Win
        if goalsFor > goalsAgainst
            team[ :w ]   += 1
            team[ :pts ] += Football::WIN_POINTS

        # Loss
        elsif goalsFor < goalsAgainst
            team[ :l ] += 1

        # Draw
        else
            team[ :d ]   += 1
            team[ :pts ] += Football::DRAW_POINTS
        end

    end

    ##
    # Process previous 10 games
    # Add the last 10 fixtures for use in the table details. Require state win,
    # lose or draw, score, team versus and game date
    #
    # @return INT Amount of points to deduct
    ##
    def self.previousGames( team )

        team[ :previousGames ] = 1

    end

    ##
    # Process point deductions
    # Corresponds to the season and division the club is in
    #
    # @return INT Amount of points to deduct
    ##
    def self.pointDeduction()
    end

    ##
    # Check Fixtures
    # Error check that the fixture is entered correctly - this goes for fixtures
    # placed in the future or do not yet have a result associated to them
    #
    # @return exception
    ##
    def self.checkFixture()
    end

    ##
    # Check team Exists
    # Check against the Team CSV that the team in the fixtures correlates to a
    # team in the teams.csv for the correct season and division if not flag
    #
    # @return exception
    ##
    def self.checkTeam()
    end

end