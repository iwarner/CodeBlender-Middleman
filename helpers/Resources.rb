##
# Helper methods to iterate through the Resources
#
# portfolio( "portfolio" )
#
# Examples Data
# @path              = "blog/en/portfolio/facebook/2012-01-01-guinness-arthurs-day.html",
# @source_file       = "/Users/ianwarner/Dropbox/www/DryKiss/drykiss.com/source/blog/en/portfolio/facebook/2012-01-01-guinness-arthurs-day.html.md",
# @destination_paths = [ "blog/en/portfolio/facebook/2012-01-01-guinness-arthurs-day.html",
#                        "/portfolio/facebook/guinness-arthurs-day.html",
#                        "portfolio/facebook/guinness-arthurs-day.html",
#                        "portfolio/facebook/guinness-arthurs-day/index.html" ],
# @local_metadata    = {:options=>{}, :locals=>{}, :page=>{}, :blocks=>[]},
# @enhanced_data     = {
#     "author"      => "Ian Warner",
#     "date"        => "2012-01-01 11:25 BST",
#     "description" => "To celebrate Arthur's Day Guinness required a Facebook page that could be distributed amongst it's marketing locations.",
#     "category"    => "portfolio",
#     "subcategory" => "facebook",
#     "image"       => "/assets/images/site/portfolio/ad.png",
#         "alt" => "Guinness Facebook Page",
#     "keywords"    => "Facebook, social, social media, development",
#     "published"   => true,
#     "tags"        => [ "facebook", "social" ],
#     "title"       => "Guinness® Facebook Page"},
#  @_date       = Sun, 01 Jan 2012 10:25:00 GMT +00:00,
#  @_path_parts = [ "en", "portfolio", "facebook", "2012", "01", "01", "guinness-arthurs-day.html" ],
#  @_slug       = "guinness-arthurs-day.html">
#
# @author Ian Warner <ian.warner@drykiss.com>
##

##
#
##
module Resources

    ##
    # Unique Categories
    # The blog post must have category in the front matter
    ##
    def categories( exclude = [] )

        # Create Return Array
        ret = []

        # Get the Unique Categories
        sitemap.resources.uniq{ | r | r.data.category }.each do | articles |

            if ! articles.data.category.nil? and ! exclude.include?( articles.data.category )
                ret << articles.data.category
            end

        end

        # Return
        ret

    end

    ##
    # Resources by tag and extension
    #
    # Usage
    # byTag( [ "seo" ] )
    #
    # @param tags       - Mixed - Required
    # @param extensions - Array - Optional - Default : md
    ##
    def byTag( tags, extensions = [ "md" ] )

        # Check tags is an array
        if ! tags.kind_of?( Array )
            tags = [ tags ]
        end

        # Check extensions exist and is correct
        if ! extensions.kind_of?( Array )
            p "articlesByTag - Extensions should be an Array"
            abort
        end

        # Create Return Array
        ret = []

        # Resources that contain the Tag and have the correct extension
        sitemap.resources.select { | r | extensions.include?( r.source_file.split( '.' ).last ) &&
                                       ( tags & Array( r.data.tags ) ).present? }.each do | r |

            ret << r.data.title

        end

        # Return
        ret

    end

    ##
    # Resources by category and extension
    #
    # Usage
    # - byCategory( "venues", [ "md" ], nil ).each do | article |
    #
    # @param category   - Array - Required
    # @param extensions - Mixed - Optional - Default : md
    ##
    def byCategory( category, extensions = [ "md" ], limit = nil )

        # Check category is an array
        if ! category.kind_of?( Array )
            category = [ category ]
        end

        # Create Return Array
        ret = []

        # Get Resources
        resources = sitemap.resources.select { | r | extensions.include?( r.source_file.split('.').last ) &&
                                                   ( category & Array( r.data.category ) ).present? }

        # Check limit is set
        if ! limit.nil?
            resources = resources.take( limit )
        end

        # Get the resources that are
        resources.each do | r |
            ret << r
        end

        # Return
        ret

    end

    ##
    # Todo Resources
    # Resources that contain the Todo Frontmatter should be collected
    #
    # @param object - Array - Required
    ##
    def todo( object = [ "todo" ] )

    end

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
            ret["subcategories"] << { "name" => d.capitalize,
                                      "path" => "/our-work/#{ d }" }

            # Push the articles into the Array
            ret["articles"] << a

        end

        # Sort the Subcategories by Name Alphabetically
        ret["subcategories"] = ret["subcategories"].sort_by { |h| h["name"] }.uniq

        # Generate the Portfolio Home Page
        proxy "/our-work.html",
              "templates/portfolio.html", :locals => { :subcategories => ret["subcategories"],
                                                       :subcategory   => "all",
                                                       :pages         => ret["articles"] },
                                          :ignore => true

        # Return
        ret

    end

end