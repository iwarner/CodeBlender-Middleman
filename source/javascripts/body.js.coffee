##
# JavaScript for the body area
#
# @author Ian Warner <ian.warner@drykiss.com>
##

# JQuery
//= require jquery/dist/jquery.min

# Angular JS
//= require angular/angular.min
//= require angular-ui-router/release/angular-ui-router.min

# Bootstrap
//= require bootstrap-sass-official/assets/javascripts/bootstrap-sprockets

# App
//= require_tree ./_lib/app

# Router
//= require_tree ./_lib/router

# Service
//= require_tree ./_lib/service

##
# Molecule
##
//= require facebook/_facebook
//= require login/_login_controller
//= require mailchimp/_subscription_controller
//= require top-icon/_top-icon_controller
//= require popover/_popover_directive
//= require tooltip/_tooltip_directive

##
# Organism
##

# Angular UI grid
//= require sidebar/_sidebar

# Code
//= require code/_code_controller

##
# Template
##

# Portfolio
//= require portfolio/_portfolio_controller