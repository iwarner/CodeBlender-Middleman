##
# JavaScript for the body area
#
# @author Ian Warner <ian.warner@drykiss.com>
##

# JQuery
#= require jquery/dist/jquery.min

# Mix It Up
#= require mixitup/build/jquery.mixitup.min

# DataTables
#= require DataTables/media/js/jquery.dataTables

# Angular JS
#= require angular/angular.min
#= require angular-animate/angular-animate.min
#= require angular-ui-router/release/angular-ui-router.min
#= require angular-ui-grid/ui-grid.min
#= require angular-resource/angular-resource.min
#= require angular-sanitize/angular-sanitize
#= require angular-bootstrap-checkbox/angular-bootstrap-checkbox
#= require ngstorage/ngStorage.min
#= require ng-tags-input/ng-tags-input.min

# Angular Bootstrap DataTables
#= require angular-datatables/dist/angular-datatables
#= require angular-datatables/dist/plugins/bootstrap/angular-datatables.bootstrap

# Angular Clipboard
#= require zeroclipboard/dist/ZeroClipboard
#= require ng-clip/dest/ng-clip.min

# Firebase
#= require firebase/firebase

# Angular Fire
#= require angularfire/dist/angularfire

# Bootstrap
#= require bootstrap-sass-official/assets/javascripts/bootstrap-sprockets

# Angular UI
#= require angular-bootstrap/ui-bootstrap.min
#= require angular-bootstrap/ui-bootstrap-tpls.min

# App
#= require_tree ./_lib/app

# Router
#= require_tree ./_lib/router

# Service
#= require_tree ./_lib/service

##
# Molecule
##
#= require facebook/login/_facebook_module
#= require login/_login_controller
#= require mailchimp/_mailchimp_controller
#= require top-icon/_top-icon_controller
#= require popover/_popover_directive
#= require tooltip/_tooltip_directive

# Search input
#= require search-input/_search-input_controller
#= require search-input/_search-input_directive

##
# Organism
##

# Angular UI grid
#= require sidebar/_sidebar

# Code
#= require code/_code_controller

##
# Template
##

# Portfolio
#= require portfolio/_portfolio_controller
