xml.instruct!

xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do

    sitemap.resources.select { | page | page.path =~ /\.html/ }.each do | page |

        location = page.url.gsub( /\//, "" )

        xml.url do
            xml.loc        "#{ dataConfig.url }/#{ location }"
            xml.lastmod    Date.today.to_time.iso8601
            xml.changefreq page.data.changefreq || "monthly"
            xml.priority   page.data.priority     || "0.5"
        end

    end

end