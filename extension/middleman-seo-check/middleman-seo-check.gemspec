# -*- encoding: utf-8 -*-
$:.push File.expand_path( "../lib", __FILE__ )

Gem::Specification.new do | s |

    s.name        = "middleman-seo-check"
    s.version     = "0.0.1"
    s.platform    = Gem::Platform::RUBY
    s.authors     = [ "Ian Warner" ]
    s.email       = [ "ian.warner@drykiss.com" ]
    s.homepage    = "http://drykiss.com"
    s.summary     = %q{Middleman SEO page checker}
    s.description = %q{Middleman SEO page checker}
    s.license   = 'MIT'

    s.files         = `git ls-files`.split( "\n" )
    s.test_files    = `git ls-files -- {test,spec,features}/*`.split( "\n" )
    s.executables   = `git ls-files -- bin/*`.split( "\n" ).map{ | f | File.basename( f ) }
    s.require_paths = ["lib"]

    # The version of middleman-core your extension depends on
    s.add_runtime_dependency( "middleman-core", [ ">= 4.1.10" ] )
    s.add_runtime_dependency( "nokogiri", ">= 1.6.8" )

    s.add_development_dependency 'appraisal'
    s.add_development_dependency 'aruba'
    s.add_development_dependency 'cucumber'
    s.add_development_dependency 'pry'
    s.add_development_dependency 'rake'
    s.add_development_dependency 'rspec'
    s.add_development_dependency 'rspec-its'
    s.add_development_dependency 'rubocop'
    s.add_development_dependency 'simplecov'

end
