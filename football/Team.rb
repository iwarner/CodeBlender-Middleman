##
# Team
#
# Create methods to get Results for Team, compare past fixtures between two teams
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# Team
##
module Team

    # Extend Core Football
    extend Football

    ##
    # Returns an array of all the fixtures this team has played in
    #
    # @param  int   Optional Season identifier otherwise return all
    # @param  bool  Optional Reuturn unplayed fixtures only
    # @return array Fixtures array
    ##
    def self.fixtures( team, season, unplayed )
        fixtures = processFixtures[ team ][ season ][ unplayed ]
    end

    ##
    # Simply get the last and next game for the team.
    #
    # @return array Array showing just last and next game
    ##
    def self.lastNext( team )
        fixtures = processFixtures[ team ][ season ][ unplayed ]
    end

    ##
    # Get the average goals scored this season
    #
    # @return array
    ##
    def self.averageGoals( team, season )
        goal = processFixtures[ team ][ season ]
    end

    ##
    # Get a list of this teams honour
    #
    # @return array Array of the teams honours, league and cup
    ##
    def self.honours

        # Return
        return honours

    end

end