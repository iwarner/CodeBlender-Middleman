##
# Venue
#
# Compile the Venues used - get past matches and fixtures
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# Venue
##
module Venue

    # Extend Core Football
    extend Football

    ##
    # Returns the history of games played at this venue
    #
    # @return array Tabular tally of stats for the season and division
    ##
    def self.venue( season, division )

        divisonFixtures = processFixtures[ season ][ division ]

        # Sort by date of fixture

    end

end