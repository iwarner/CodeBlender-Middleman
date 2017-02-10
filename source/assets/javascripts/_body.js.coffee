##
# JavaScript for the body area
#
# @author Ian Warner <ian.warner@drykiss.com>
##

# JQuery
require 'jquery'

# Lodash
require 'lodash'

# MixItUp
require 'mixitup'

# Angular JS
require 'angular'
require 'angular-animate'
require 'angular-google-maps'
require 'angular-resource'
require 'angular-sanitize'
require 'angular-ui-grid'
require 'angular-ui-router'

# Angular clipboard
require 'angular-clipboard'

# NgClipboard uses clipboardJS
require 'clipboard'
require 'ngclipboard'
require 'ng-facebook'

# Angular Clipboard
window.ZeroClipboard = require "zeroclipboard"
require 'ng-clip'

# Bootstrap
require 'bootstrap-sass'

# Angular UI Bootstrap
require 'angular-ui-bootstrap'

# App
require 'lib/app/app.coffee'

# Router
require 'lib/router/default.coffee'

# Service
# require 'lib/service/auth.coffee'
# require 'lib/service/security.coffee'
# require 'lib/service/utilities.coffee'

##
# Atom
##
require 'cbatom/clipboard/_clipboard_controller.coffee'
require 'cbatom/video/_video_controller.coffee'

##
# Molecule
##
require 'cbmolecule/code/_code_controller.coffee'
require 'cbmolecule/login/_login_controller.coffee'
require 'cbmolecule/top-icon/_top-icon_controller.coffee'
require 'cbmolecule/popover/_popover_directive.coffee'
require 'cbmolecule/tooltip/_tooltip_directive.coffee'
require 'cbmolecule/search-input/_search-input_controller.coffee'
require 'cbmolecule/search-input/_search-input_directive.coffee'

##
# Organism
##
require 'cborganism/sidebar/_sidebar.coffee'

##
# Social
##
require 'cbsocial/facebook/_facebook_controller.coffee'
require 'cbsocial/google/analytics/_analytics_controller.coffee'
require 'cbsocial/mailchimp/_mailchimp_controller.coffee'
require 'cbsocial/twitter/_twitter_controller.coffee'

##
# Template
##
require 'cbtemplate/contact/_contact_controller.coffee'
require 'cbtemplate/portfolio/_portfolio_controller.coffee'
