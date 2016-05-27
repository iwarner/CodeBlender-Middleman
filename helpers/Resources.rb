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

    def full_title( page_title = nil )

        page_title ||= ""
        base_title   = "Euro Team Outreach"

        if page_title.empty?
            base_title
        else
            page_title + " | " + base_title
        end

    end

    def smart_robots
        if !!( current_page.path =~ /thanks/ )
            "noindex, nofollow"
        else
            "index, follow"
        end
    end

    def page_description
        current_page.data.description || data.site.description
    end

    # https://robots.thoughtbot.com/organized-workflow-for-svg
    # https://gist.github.com/bitmanic/0047ef8d7eaec0bf31bb
    def inline_svg( filename, options = {} )

        root      = Middleman::Application.root
        file_path = "#{ root }/source/images/#{ filename }"

        if File.exists?( file_path )

            file = File.read( file_path ).force_encoding( "UTF-8" )
            doc  = Nokogiri::HTML::DocumentFragment.parse file
            svg  = doc.at_css "svg"

            if options[ :class ].present?
                svg[ "class" ] = options[ :class ]
            end

            doc

        else
            "file not found: #{ file_path }"
        end

    end

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
    # Unique Category
    # The blog post must have category in the front matter
    ##
    def category( exclude = [] )

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