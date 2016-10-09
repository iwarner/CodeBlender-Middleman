xml.instruct!

xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do

    xml.id       "urn:uuid:#{ data.config.brand.downcase }:#{ data.config.url }"

    xml.title    data.config.atomTitle
    xml.subtitle data.config.atomSubTitle

    xml.link     "href" => data.config.url
    xml.link     "href" => "#{ data.config.url }feed.xml", "rel" => "self"

    xml.author   {
        xml.name  data.config.brand
        xml.email data.config.email
        xml.uri   data.config.uri
    }

    xml.updated  blog( "docs" ).articles.first.date.to_time.iso8601

    blog( "docs" ).articles[ 0..1 ].each do | article |

        xml.entry do

            xml.id        "#{ data.config.url }#{ article.url }"
            xml.title     article.title
            xml.published article.date.to_time.iso8601
            xml.updated   article.date.to_time.iso8601
            xml.category  article.data.category
            xml.link      "rel" => "alternate", "href" => article.url
            xml.summary   article.summary, "type" => "html"
            xml.content   article.body,    "type" => "html"
            xml.author {
                xml.name  data.config.brand
                xml.email data.config.email
                xml.uri   data.config.uri
            }

        end

    end

end
