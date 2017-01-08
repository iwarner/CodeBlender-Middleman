##
# Seo check
##

# Require
require "middleman-core"
require 'middleman-seo-check/title'

Middleman::Extensions.register( :seoCheck ) do

    require "middleman-seo-check/extension"
    ::Middleman::SeoCheck

end
