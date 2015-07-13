##
# Helper methods to iterate through the Article resources
#
# Usage
#
# articlesByTag( [ "seo" ] )
# articlesPortfolio( "portfolio" )
#
# Article Data
#
# @path="blog/en/portfolio/facebook/2012-01-01-guinness-arthurs-day.html",
# @source_file="/Users/ianwarner/Dropbox/www/DryKiss/drykiss.com/source/blog/en/portfolio/facebook/2012-01-01-guinness-arthurs-day.html.md",
# @destination_paths=["blog/en/portfolio/facebook/2012-01-01-guinness-arthurs-day.html", "/portfolio/facebook/guinness-arthurs-day.html", "portfolio/facebook/guinness-arthurs-day.html", "portfolio/facebook/guinness-arthurs-day/index.html"],
# @local_metadata={:options=>{}, :locals=>{}, :page=>{}, :blocks=>[]},
# @enhanced_data={
#   "author"=>"Ian Warner",
#   "date"=>"2012-01-01 11:25 BST",
#   "description"=>"To celebrate Arthur's Day Guinness required a Facebook page that could be distributed amongst it's marketing locations.",
#   "category"=>"portfolio",
#   "subcategory"=>"facebook",
#   "image"=>"/assets/images/site/portfolio/ad.png",
#     "alt"=>"Guinness Facebook Page",
#   "keywords"=>"Facebook, social, social media, development",
#   "published"=>true,
#   "tags"=>["facebook", "social"],
#   "title"=>"Guinness® Facebook Page"},
#  @_date=Sun, 01 Jan 2012 10:25:00 GMT +00:00,
#  @_path_parts=["en", "portfolio", "facebook", "2012", "01", "01", "guinness-arthurs-day.html"],
#  @_slug="guinness-arthurs-day.html">
##

# module Articles

#     ##
#     # Unique Categories
#     ##
#     def articlesCategories( exclude = [] )

#         # # Create Return Array
#         ret = []

#         # Get the Unique Categories
#         sitemap.resources.
#         { |r| r.data.category }.each do | articles |

#             if !articles.data.category.nil? and !exclude.include?( articles.data.category )
#                 ret << articles.data.category
#             end

#         end

#         # Return
#         ret

#     end

#     ##
#     # Articles by tag and extension
#     #
#     # tags       - Mixed - Required
#     # extensions - Mixed - Optional - Default : md
#     ##
#     def articlesByTag( tags, extensions = [ "md" ] )

#         # Check tags is an array
#         if !tags.kind_of?(Array)
#             tags = [ tags ]
#         end

#         # Check extensions exist and is correct
#         if !extensions.kind_of?(Array)
#             p "articlesByTag - Extensions should be an Array"
#             abort
#         end

#         # Create Return Array
#         ret = []

#         # Get the resources that are
#         sitemap.resources.select { |r| extensions.include?( r.source_file.split('.').last ) &&
#                                        ( tags & Array( r.data.tags ) ).present? }.each do |a|

#             ret << a.data.title

#         end

#         # Return
#         ret

#     end

#     ##
#     # Articles by category and extension
#     #
#     # category   - Array - Required
#     # extensions - Mixed - Optional - Default : md
#     ##
#     def articlesByCategory( category, extensions = [ "md" ], limit = 3 )

#         # Check category is an array
#         if !category.kind_of?(Array)
#             category = [ category ]
#         end

#         # Create Return Array
#         ret = []

#         # Get Resources
#         resources = sitemap.resources.select { |r| extensions.include?( r.source_file.split('.').last ) &&
#                                                    ( category & Array( r.data.category ) ).present? }

#         # Check limit is set
#         if !limit.nil?
#             resources = resources.take( limit )
#         end

#         # Get the resources that are
#         resources.each do |a|

#             ret << a

#         end

#         # Return
#         ret

#     end

#     ##
#     # Get portfolio articles
#     #
#     # category - String - Required
#     ##
#     def articlesPortfolio( category = [ "portfolio" ] )

#         # Create Portfolio Hash
#         ret = {
#             "subcategories" => [{ "name" => "All", "path" => "/our-work" }],
#             "articles"      => []
#         }

#         # Loop through the Resources
#         articlesByCategory( category, [ "md" ], nil ).each do |a|

#             # Reference to the Data
#             d = a.data.subcategory

#             # Push the subcategories into the Array
#             ret["subcategories"] << { "name" => d.capitalize,
#                                       "path" => "/our-work/#{ d }" }

#             # Push the articles into the Array
#             ret["articles"] << a

#         end

#         # Sort the Subcategories by Name Alphabetically
#         ret["subcategories"] = ret["subcategories"].sort_by { |h| h["name"] }.uniq

#         # Generate the Portfolio Home Page
#         proxy "/our-work.html",
#               "templates/portfolio.html", :locals => { :subcategories => ret["subcategories"],
#                                                        :subcategory   => "all",
#                                                        :pages         => ret["articles"] },
#                                           :ignore => true

#         # Return
#         ret

#     end

# end