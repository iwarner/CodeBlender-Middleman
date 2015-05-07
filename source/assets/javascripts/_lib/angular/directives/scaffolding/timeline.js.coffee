##
# Timeline Directive
#
# @author Ian Warner <ian.warner@drykiss.com>
#
# @see http://onehungrymind.com/angularjs-dynamic-templates/
##

##
# JS Lint
##
'use strict'

##
# Content Item
##
app.directive 'contentItem', ( $compile ) ->

    #
    linker = ( scope, element, attrs ) ->

        # Return
        return {
            restrict : 'E'
            link     : linker
            scope    : content: '='
        }

# app.directive('contentItem', function ($compile) {
#     var imageTemplate = '<div class="entry-photo"><h2>&nbsp;</h2><div class="entry-img"><span><a href="{{rootDirectory}}{{content.data}}"><img ng-src="{{rootDirectory}}{{content.data}}" alt="entry photo"></a></span></div><div class="entry-text"><div class="entry-title">{{content.title}}</div><div class="entry-copy">{{content.description}}</div></div></div>';
#     var videoTemplate = '<div class="entry-video"><h2>&nbsp;</h2><div class="entry-vid"><iframe ng-src="{{content.data}}" width="280" height="200" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe></div><div class="entry-text"><div class="entry-title">{{content.title}}</div><div class="entry-copy">{{content.description}}</div></div></div>';
#     var noteTemplate = '<div class="entry-note"><h2>&nbsp;</h2><div class="entry-text"><div class="entry-title">{{content.title}}</div><div class="entry-copy">{{content.data}}</div></div></div>';

#     var getTemplate = function(contentType) {
#         var template = '';

#         switch(contentType) {
#             case 'image':
#                 template = imageTemplate;
#                 break;
#             case 'video':
#                 template = videoTemplate;
#                 break;
#             case 'notes':
#                 template = noteTemplate;
#                 break;
#         }

#         return template;
#     }

#     var linker = function(scope, element, attrs) {
#         scope.rootDirectory = 'images/';

#         element.html(getTemplate(scope.content.content_type)).show();

#         $compile(element.contents())(scope);
#     }

#     return {
#         restrict: "E",
#         link: linker,
#         scope: {
#             content:'='
#         }
#     };
# });