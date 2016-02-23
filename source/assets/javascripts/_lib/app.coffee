##
# Angular initialisation
#
# @author Ian Warner <ian.warner@drykiss.com>
##

# App
//= require_tree ./app

# Router
//= require_tree ./router

# Service
//= require_tree ./service

##
# Atom
##

##
# Molecule
##

//= require molecule/facebook/_facebook
//= require molecule/login/_login_controller
//= require molecule/mailchimp/_subscription_controller
//= require molecule/top-icon/_top-icon_controller
//= require molecule/popover/_popover_directive
//= require molecule/tooltip/_tooltip_directive

##
# Organism
##

# Angular UI grid
//= require organism/angular-ui-grid/_angular-ui-grid_controller
#  require organism/angular-ui-grid/_angular-ui-grid-add_controller
#  require organism/angular-ui-grid/_angular-ui-grid-edit_controller
//= require organism/angular-ui-grid/_angular-ui-grid_service
//= require organism/sidebar/_sidebar

# Code
//= require organism/code/_code_controller

##
# Template
##

# Portfolio
//= require template/portfolio/_portfolio_controller