##
# Setting
#
# Read the settings CSV file and provide methods for accessing these.
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
# Setting
##
module Setting

    # Extend Core Football
    extend Football

    ##
    # Get a single key from the settings
    ##
    def self.getKey( key )

        # Read the CSV
        data = readCSV( "csv/settings.csv" )

        # Loop through the CSV
        data.each do | row |

            if row[ 0 ].include?( key )
                return row[ 1 ]
            end

        end

    end

end