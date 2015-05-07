##
# Portfolio
#
# portfolio( "portfolio" )
#
# @author Ian Warner <ian.warner@drykiss.com>
##
module Portfolio

    ##
    # Get portfolio articles
    #
    # category - String - Required
    ##
    def portfolio( category = [ "portfolio" ] )

        # Create Portfolio Hash
        ret = {
            "subcategories" => [{ "name" => "All", "path" => "/our-work" }],
            "articles"      => []
        }

        # Loop through the Resources
        byCategory( category, [ "md" ], nil ).each do |a|

            # Reference to the Data
            d = a.data.subcategory

            # Push the subcategories into the Array
            ret[ "subcategories" ] << { "name" => d.capitalize,
                                        "path" => "/our-work/#{ d }" }

            # Push the articles into the Array
            ret[ "articles" ] << a

        end

        # Sort the Subcategories by Name Alphabetically
        ret[ "subcategories" ] = ret[ "subcategories" ].sort_by { | h | h[ "name" ] }.uniq

        # Generate the Portfolio Home Page
        proxy "/our-work.html",
              "templates/portfolio.html", locals: { subcategories: ret[ "subcategories" ],
                                                    subcategory:   "all",
                                                    pages:         ret[ "articles" ] },
                                          ignore: true

        # Return
        ret

    end

end