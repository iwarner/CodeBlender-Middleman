##
# Helper methods to iterate through the Resources
#
# @usage
# -# SubCategory Elements
# = subCategory( "portfolio" )
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category helper
##
module Resources

    ##
    # Unique SubCategory
    ##
    def subCategory( blog = 'portfolio', exclude = [] )

        # Create Return Array
        ret = []

        # Get the Unique Categories
        blog( blog ).articles.uniq{ | r | r.data.subcategory }.each do | articles |

            if ! articles.data.subcategory.nil? and ! exclude.include?( articles.data.subcategory )
                ret << articles.data.subcategory
            end

        end

        # Return
        ret

    end

    ##
    # Category list
    # Returns a list of categories, optionally excluding any from the list.
    #
    # @usage
    # = categoryList( [ "seo" ] )
    #
    # @param exclude - array - optional
    # @return array
    # [ "inspiration", "recipes", "news" ]
    ##
    def categoryList( exclude = [] )

        # Create return array
        ret = []

        # Get the unique categories
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
    # = byTag( [ "seo" ] )
    #
    # @param tags      - mixed - required
    # @param extension - array - optional - Default : md
    ##
    def byTag( tags, extension = [ "md" ] )

        # Check tags is an array
        if ! tags.kind_of?( Array )
            tags = [ tags ]
        end

        # Check extensions exist and is correct
        if ! extension.kind_of?( Array )
            p "articlesByTag - Extensions should be an Array"
            abort
        end

        # Create return array
        ret = []

        # Resources that contain the Tag and have the correct extension
        sitemap.resources.select { | r | extension.include?( r.source_file.split( '.' ).last ) &&
                                       ( tags & Array( r.data.tags ) ).present? }.each do | r |

            ret << r.data.title

        end

        # Return
        ret

    end

    ##
    # Resources by category and extension
    #
    # @usage
    # - byCategory( "venues", [ "md" ], nil ).each do | article |
    #     = article
    #
    # @param category  - array - required
    # @param extension - mixed - optional - default : md
    # @param limit     - int   - optional - default : nil
    ##
    def byCategory( category, extension = [ "md" ], limit = nil )

        # Check category is an array
        if ! category.kind_of?( Array )
            category = [ category ]
        end

        # Create Return Array
        ret = []

        # Get Resources
        resources = sitemap.resources.select { | r | extension.include?( r.source_file.split('.').last ) &&
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

    # ##
    # # Get portfolio articles
    # #
    # # category - String - Required
    # ##
    # def articlesPortfolio( category = [ "portfolio" ] )

    #     # Create Portfolio Hash
    #     ret = {
    #         "subcategories" => [{ "name" => "All", "path" => "/our-work" }],
    #         "articles"      => []
    #     }

    #     # Loop through the Resources
    #     articlesByCategory( category, [ "md" ], nil ).each do |a|

    #         # Reference to the Data
    #         d = a.data.subcategory

    #         # Push the subcategories into the Array
    #         ret["subcategories"] << { "name" => d.capitalize,
    #                                   "path" => "/our-work/#{ d }" }

    #         # Push the articles into the Array
    #         ret["articles"] << a

    #     end

    #     # Sort the Subcategories by Name Alphabetically
    #     ret["subcategories"] = ret["subcategories"].sort_by { |h| h["name"] }.uniq

    #     # Generate the Portfolio Home Page
    #     proxy "/our-work.html",
    #           "templates/portfolio.html", :locals => { :subcategories => ret["subcategories"],
    #                                                    :subcategory   => "all",
    #                                                    :pages         => ret["articles"] },
    #                                       :ignore => true

    #     # Return
    #     ret

    # end

end
