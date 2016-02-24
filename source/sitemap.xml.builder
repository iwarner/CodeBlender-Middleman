---

layout : false

---

# XML document - encoding: utf-8
# @see https://gist.github.com/tommysundstrom/5756032
# http://www.sitemaps.org/en_GB/protocol.html
xml.instruct!

# XML Document
xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do

    # Loop through the resources
    sitemap.resources.select { | page | page.path =~ /\.html/ }.each do | page |

        # Remove the channel html
        if ! page.url.start_with?( '/channel.html' )

            # Create the details
            xml.url do
                xml.loc        "#{ data.config.url }#{ page.url }"
                xml.lastmod    Date.today.to_time.iso8601
                xml.changefreq page.data.changefreq || "weekly"
                xml.priority   page.data.priority   || "0.5"
            end

        end

    end

end