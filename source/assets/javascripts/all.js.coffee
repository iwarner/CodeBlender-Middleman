##
# Application Combined Javascript
#
# @author Ian Warner <ian.warner@drykiss.com>
##

# Jquery
//= require jquery/dist/jquery

# Jquery Validation
//= require jquery-validation/dist/jquery.validate

# JQuery Mobile
//= require ./_vendor/jquery-mobile/jquery.mobile.custom

# JCrop
//= require jcrop/js/jquery.Jcrop

# Backbone and Underscore
//= require underscore/underscore
//= require backbone/backbone
//= require backbone-validation/dist/backbone-validation

# GreenSock GSAP
//= require gsap/src/minified/TweenMax.min.js

# CSV
# require comma-separated-values/csv

# Card
# require card/lib/js/card

# CK Editor
//= require ckeditor/ckeditor

# Lunr
//= require lunr.js/lunr

# DataTables
# require DataTables/media/js/jquery.dataTables

# Dropzone
# require dropzone/downloads/dropzone

# Melon JS
# require "./_vendor/melonjs/melonJS-1.0.2"

# Stripe
//= require ./_vendor/stripe/checkout.min

# Simple Cart
# require simplecart-js/

# Snap
//= require Snap.svg/dist/snap.svg-min

# Bootstrap
//= require affix
//= require alert
//= require button
//= require carousel
//= require collapse
//= require dropdown
//= require tab
//= require transition
//= require scrollspy
//= require modal
//= require tooltip
//= require popover
//= require bootstrapx-clickover-bs3/js/bootstrapx-clickover

# Holder
//= require holderjs/holder

# App
//= require ./_lib/app

# Plugin
//= require _library/plugin/lightBox
//= require _library/plugin/serialize

# Utilities
//= require _library/utils/logger
//= require _library/utils/ajax
//= require _library/utils/language
//= require _library/utils/facebook
//= require _library/utils/mobile
//= require _library/utils/popover
//= require _library/utils/topIcon
//= require _library/utils/validation

# Classes
//= require _library/classes/ecommerce/stripe

//= require _library/classes/forms/fileImagePreviewPopover
//= require _library/classes/forms/passwordStrengthMeter

//= require _library/classes/google/geoCode
//= require _library/classes/google/map

//= require _library/classes/mobile/device

//= require _library/classes/scaffolding/capsule
//= require _library/classes/scaffolding/cookies
//= require _library/classes/scaffolding/geoLocation
//= require _library/classes/scaffolding/localStorage
//= require _library/classes/scaffolding/notification
//= require _library/classes/scaffolding/scrollTop
//= require _library/classes/scaffolding/urlParams

# Models
//= require _library/models/session
//= require _library/models/user
//= require_tree ./_lib/models

# Views
//= require_tree ./_lib/views

# Router
//= require_tree ./_lib/router