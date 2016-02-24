##
# Methods to generate Football Sites
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    https://github.com/iwarner/CodeBlender-Middleman/tree/master/football
# @see    https://github.com/iwarner/CodeBlender-Middleman/tree/master/source/localizable/football
# @see    http://codeblender.net/football/table/table.html
##

##
# Helper
##
module FootballHelpers

    # Team profile link
    def teamProfileLink( team )

        # Team stub
        teamStub = team.strip.downcase.gsub( /[^a-z0-9\- ]/, ' ' ).gsub( / /, '-' )

        # Link
        link_to( team, "/team/#{ teamStub }" )

    end

end

##
# Football
##
module Football

    # Constants
    WIN_POINTS   = 3
    DRAW_POINTS  = 1
    SHEET        = "1uTnHOsDCHwvxmxX41sxCsZDnkPNj_7ImUGYQb3yEMjo"
    FIXTURES_GID = "1137121615"
    TEAM_CSV     = "csv/teams.csv"
    FIXTURES_CSV = "csv/fixtures.csv"

    ##
    # Google URL
    # The sheet needs to be read only by everyone
    ##
    def google_csv_url
        "https://docs.google.com/spreadsheets/d/#{ google_local_key }/export?format=csv#{ google_local_key }"
    end

    ##
    # Read the defined file and return the array
    #
    # @param file
    ##
    def readCSV( file )

        data = []

        CSV.new( open( "https://docs.google.com/spreadsheets/d/1uTnHOsDCHwvxmxX41sxCsZDnkPNj_7ImUGYQb3yEMjo/export?format=csv&gid=1137121615" ) ).each_with_index do | row, row_index |
        # CSV.foreach( file, headers: true ) do | row |
            data << row
        end

        return data

    end

    ##
    # Add teams to the fixtures/results, if not yet included
    ##
    def addTeams( hash )

        CSV.foreach( TEAM_CSV, headers: true ) do | row |

            # Assign to Variables
            season   = row[ 0 ].strip.to_i
            division = row[ 1 ].strip.to_i
            team     = row[ 2 ].strip

            seasonDivisions         = initiateSeasonDivision( hash, season, division )
            seasonDivisions[ team ] = { p: 0, w: 0, d: 0, l: 0, f: 0, a: 0, gd: 0, pts: 0 } unless seasonDivisions.keys.include?( team )

        end

    end

    ##
    # Add season and division sub hashes, if not included already and return the same
    #
    # @return hash Normalised Hash
    ##
    def initiateSeasonDivision( hash, season, division )

        hash[ season ]             = {} unless hash.keys.include?( season )
        hash[ season ][ division ] = {} unless hash[ season ].keys.include?( division )

        return hash[ season ][ division ]

    end

end
