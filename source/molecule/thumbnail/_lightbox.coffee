##
# Lightbox
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://kaibun.net/blog/2013/04/19/a-fully-fledged-coffeescript-boilerplate-for-jquery-plugins/
# @see    http://ashleydw.github.io/lightbox/
##

"use strict";

$ = jQuery

##
#
##
CBLightbox = ( element, options ) ->

    ##
    # Options
    # Merge with defaults
    ##
    @options = $.extend({
        title  : null
        footer : null
        remote : null
    }, $.fn.CBLightbox.defaults, options || {} )

    ##
    # Variables
    ##
    @$element = $( element )
    content   = ''

    @modal_id = if @options.modal_id then @options.modal_id else 'CBLightbox-' + Math.floor((Math.random() * 1000) + 1)
    header = '<div class="modal-header"'+(if @options.title or @options.always_show_close then '' else ' style="display:none"')+'><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button><h4 class="modal-title">' + (@options.title || "&nbsp;") + '</h4></div>'
    footer = '<div class="modal-footer"'+(if @options.footer then '' else ' style="display:none"')+'>' + @options.footer + '</div>'
    $(document.body).append '<div id="' + @modal_id + '" class="CB-lightbox modal fade" tabindex="-1"><div class="modal-dialog"><div class="modal-content">' + header + '<div class="modal-body"><div class="CB-lightbox-container"><div></div></div></div>' + footer + '</div></div></div>'

    @modal         = $ "#" + @modal_id
    @modal_dialog  = @modal.find( '.modal-dialog' ).first()
    @modal_content = @modal.find( '.modal-content' ).first()
    @modal_body    = @modal.find( '.modal-body' ).first()
    @modal_arrows  = null

    @lightbox_container = @modal_body.find('.CB-lightbox-container').first()
    @lightbox_body      = @lightbox_container.find('> div:first-child').first()

    @border = {
        top: parseFloat(@modal_dialog.css('border-top-width')) + parseFloat(@modal_content.css('border-top-width')) + parseFloat(@modal_body.css('border-top-width'))
        right: parseFloat(@modal_dialog.css('border-right-width')) + parseFloat(@modal_content.css('border-right-width')) + parseFloat(@modal_body.css('border-right-width'))
        bottom: parseFloat(@modal_dialog.css('border-bottom-width')) + parseFloat(@modal_content.css('border-bottom-width')) + parseFloat(@modal_body.css('border-bottom-width'))
        left: parseFloat(@modal_dialog.css('border-left-width')) + parseFloat(@modal_content.css('border-left-width')) + parseFloat(@modal_body.css('border-left-width'))
    }

    @padding = {
        top: parseFloat(@modal_dialog.css('padding-top')) + parseFloat(@modal_content.css('padding-top')) + parseFloat(@modal_body.css('padding-top'))
        right: parseFloat(@modal_dialog.css('padding-right')) + parseFloat(@modal_content.css('padding-right')) + parseFloat(@modal_body.css('padding-right'))
        bottom: parseFloat(@modal_dialog.css('padding-bottom')) + parseFloat(@modal_content.css('padding-bottom')) + parseFloat(@modal_body.css('padding-bottom'))
        left: parseFloat(@modal_dialog.css('padding-left')) + parseFloat(@modal_content.css('padding-left')) + parseFloat(@modal_body.css('padding-left'))
    }

    @modal
    .on('show.bs.modal', @options.onShow.bind(@))
    .on 'shown.bs.modal', =>
        @modal_shown()
        @options.onShown.call(@)
    .on('hide.bs.modal', @options.onHide.bind(@))
    .on 'hidden.bs.modal', =>
        if @gallery
            $(document).off 'keydown.CBLightbox'
        @modal.remove()
        @options.onHidden.call(@)
    .modal 'show', options

    @modal

CBLightbox.prototype = {
    modal_shown: ->
        # when the modal first loads
        if !@options.remote
            @error 'No remote target given'
        else

            @gallery = @$element.data('gallery')
            if @gallery
                # parents('document.body') fails for some reason, so do this manually
                if this.options.gallery_parent_selector == 'document.body' || this.options.gallery_parent_selector == ''
                    @gallery_items = $(document.body).find('*[data-toggle="lightbox"][data-gallery="' + @gallery + '"]')
                else
                    @gallery_items = @$element.parents(this.options.gallery_parent_selector).first().find('*[data-toggle="lightbox"][data-gallery="' + @gallery + '"]')
                @gallery_index = @gallery_items.index(@$element)
                $(document).on 'keydown.CBLightbox', @navigate.bind(@)

                # add the directional arrows to the modal
                if @options.directional_arrows && @gallery_items.length > 1
                    @lightbox_container.prepend('<div class="CB-lightbox-nav-overlay"><a href="#" class="'+@strip_stops(@options.left_arrow_class)+'"></a><a href="#" class="'+@strip_stops(@options.right_arrow_class)+'"></a></div>')
                    @modal_arrows = @lightbox_container.find('div.CB-lightbox-nav-overlay').first()
                    @lightbox_container.find('a'+@strip_spaces(@options.left_arrow_class)).on 'click', (event) =>
                        event.preventDefault()
                        do @navigate_left
                    @lightbox_container.find('a'+@strip_spaces(@options.right_arrow_class)).on 'click', (event) =>
                        event.preventDefault()
                        do @navigate_right

            if @options.type
                if @options.type == 'image'
                    @preloadImage(@options.remote, true)
                else if @options.type == 'youtube' && video_id = @getYoutubeId(@options.remote)
                    @showYoutubeVideo(video_id)
                else if @options.type == 'vimeo'
                    @showVimeoVideo(@options.remote)
                else
                    @error "Could not detect remote target type. Force the type using data-type=\"image|youtube|vimeo\""

            else
                @detectRemoteType(@options.remote)

    strip_stops: (str) ->
        str.replace(/\./g, '')

    strip_spaces: (str) ->
        str.replace(/\s/g, '')

    isImage: (str) ->
        str.match(/(^data:image\/.*,)|(\.(jp(e|g|eg)|gif|png|bmp|webp|svg)((\?|#).*)?$)/i)

    isSwf: (str) ->
        str.match(/\.(swf)((\?|#).*)?$/i)

    getYoutubeId: (str) ->
        match = str.match(/^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/);
        if match && match[2].length == 11 then match[2] else false

    getVimeoId: (str) ->
        if str.indexOf('vimeo') > 0 then str else false

    navigate : ( event ) ->

        event = event || window.event;
        if event.keyCode == 39 || event.keyCode == 37
            if event.keyCode == 39
                do @navigate_right
            else if event.keyCode == 37
                do @navigate_left

    navigate_left: ->

        if @gallery_items.length == 1 then return

        if @gallery_index == 0 then @gallery_index = @gallery_items.length-1 else @gallery_index-- #circular

        @$element = $(@gallery_items.get(@gallery_index))
        @updateTitleAndFooter()
        src = @$element.attr('data-remote') || @$element.attr('href')

        @detectRemoteType(src, @$element.attr('data-type'))

    navigate_right: ->

        if @gallery_items.length == 1 then return

        if @gallery_index == @gallery_items.length-1 then @gallery_index = 0 else @gallery_index++ #circular

        @$element = $(@gallery_items.get(@gallery_index))
        src = @$element.attr('data-remote') || @$element.attr('href')
        @updateTitleAndFooter()

        @detectRemoteType(src, @$element.attr('data-type'))

        if @gallery_index + 1 < @gallery_items.length
            next = $(@gallery_items.get(@gallery_index + 1), false)
            src = next.attr('data-remote') || next.attr('href')
            if next.attr('data-type') == 'image' || @isImage(src)
                @preloadImage(src, false)

    detectRemoteType: (src, type) ->
        if type == 'image' || @isImage(src)
            @options.type = 'image'
            @preloadImage(src, true)
        else if type == 'youtube' || video_id = @getYoutubeId(src)
            @options.type = 'youtube'
            @showYoutubeVideo(video_id)
        else if type == 'vimeo' || video_id = @getVimeoId(src)
            @options.type = 'vimeo'
            @showVimeoVideo(video_id)
        else
            @error "Could not detect remote target type. Force the type using data-type=\"image|youtube|vimeo\""

    updateTitleAndFooter: ->
        header = @modal_content.find('.modal-header')
        footer = @modal_content.find('.modal-footer')
        title = @$element.data('title') || "&nbsp;"
        caption = @$element.data('footer') || ""
        header.css('display', '').find('.modal-title').html(title)
        if title or @options.always_show_close then header.css('display', '') else header.css('display', 'none')
        if caption then footer.css('display', '').html(caption) else footer.css('display', 'none')
        @

    showLoading : ->
        @lightbox_body.html '<div class="modal-loading">Loading..</div>'
        @

    showYoutubeVideo : (id) ->
        aspectRatio = 560/315
        width = @$element.data('width') || 560
        width = @checkDimensions width
        height = width / aspectRatio
        @resize width
        @lightbox_body.html '<iframe width="'+width+'" height="'+height+'" src="//www.youtube.com/embed/' + id + '?badge=0&autoplay=1&html5=1" frameborder="0" allowfullscreen></iframe>'
        if @modal_arrows #hide the arrows when showing video
            @modal_arrows.css 'display', 'none'

    showVimeoVideo : (id) ->
        aspectRatio = 500/281
        width = @$element.data('width') || 560
        width = @checkDimensions width
        height = width / aspectRatio
        @resize width
        @lightbox_body.html '<iframe width="'+width+'" height="'+height+'" src="' + id + '?autoplay=1" frameborder="0" allowfullscreen></iframe>'
        if @modal_arrows #hide the arrows when showing video
            @modal_arrows.css 'display', 'none'

    error : ( message ) ->
        @lightbox_body.html message
        @

    preloadImage : ( src, onLoadShowImage) ->

        img = new Image()
        if !onLoadShowImage? || onLoadShowImage == true
            img.onload = =>
                image = $('<img />')
                image.attr('src', img.src)
                image.addClass('img-responsive')
                @lightbox_body.html image
                if @modal_arrows #show the arrows
                    @modal_arrows.css 'display', 'block'
                @resize img.width
            img.onerror = =>
                @error 'Failed to load image: ' + src

        img.src = src
        img

    resize : ( width ) ->
        #resize the dialog based on the width given, and adjust the directional arrow padding
        width_total = width + @border.left + @padding.left + @padding.right + @border.right
        @modal_dialog.css('width', 'auto') .css('max-width', width_total);

        @lightbox_container.find( 'a' ).css 'padding-top', ->
            $( @ ).parent().height() / 2
        @

    checkDimensions : ( width ) ->
        #check that the width given can be displayed, if not return the maximum size that can be
        width_total = width + @border.left + @padding.left + @padding.right + @border.right
        body_width  = document.body.clientWidth

        if width_total > body_width
            width = @modal_body.width()

        width

    close : ->
        @modal.modal('hide');
}

##
# Plugin Definition
##
$.fn.CBLightbox = ( options ) ->
    @each ->
        $this   = $( this )

        options = $.extend({
            remote                  : $this.attr( 'data-remote' ) || $this.attr( 'href' )
            gallery_parent_selector : $this.attr( 'data-parent' )
            type                    : $this.attr( 'data-type' )
        }, options, $this.data( ) )

        new CBLightbox( @, options )
        @

##
# Options
##
$.fn.CBLightbox.defaults = {
    gallery_parent_selector : '*:not( .row )'
    left_arrow_class        : '.fa .fa-chevron-left'
    right_arrow_class       : '.fa .fa-chevron-right'
    directional_arrows      : true
    type                    : null
    always_show_close       : true
    onShow                  : ->
    onShown                 : ->
    onHide                  : ->
    onHidden                : ->
}
