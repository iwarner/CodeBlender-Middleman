<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0">

    <channel>
        <title>Miscellanea</title>
        <description>Code, design &amp; cultural ephemera from Darren Newton's brain</description>
        <link>http://darrenknewton.com</link>
        <language>en-us</language>
        <lastBuildDate><%= Time.now.strftime("%a, %d %b %Y %H:%M:%S %z") %></lastBuildDate>
        <pubDate>Mon, 13 Oct 1970 16:45:00 +0000</pubDate>
        <ttl>1800</ttl>

        <% blog.articles.each do |article| %>
            <item>
                <title><%= escape_html article.title %></title>
                <description><%= strip_tags article.summary %></description>
                <link>http://darrenknewton.com<%= article.url %></link>
                <guid><%= UUID.create_sha1('darrenknewton.com' + article.url, UUID::NameSpace_URL) %></guid>
                <pubDate><%= article.date.strftime("%a, %d %b %Y %H:%M:%S %z") %></pubDate>
            </item>
        <% end %>

</channel>

</rss

