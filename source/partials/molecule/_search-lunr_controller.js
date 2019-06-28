##
# Search
# Search engine built with Lunr
#
# @author Ian Warner <ian.warner@drykiss.com>
# @see    http://lunrjs.com/
#
# <%
# entries = []
# blog.articles.each do |article|
#   entry = {
#     :title => article.title,
#     :url => article.url,
#     :content => article.body
#   }
#   entries << entry
# end
# %><%=entries.to_json %>
#
# https://github.com/slashdotdash/jekyll-lunr-js-search
##

class App.Views.Search extends Backbone.View

    ##
    # Template Settings
    ##
    _.templateSettings = interpolate :/\{\{(.+?)\}\}/g

    ##
    # Events
    ##
    events :
        "submit .searchForm" : "formSubmit"

    ##
    # Defaults
    ##
    defaults :
        title : 'Guest User'
        tags  : 23
        id    : '1'

    ##
    # Search Template
    ##
    template : $( "#search_template" ).html()

    ##
    # Initialize
    ##
    initialize : ->

        log.time "Load JSON"

        # Bind validation for Contact Form
        Backbone.Validation.bind this

        # Load up the JSON Search Index
        $.get '/assets/javascripts/data/search_index.json', ( data ) ->
            window.idx = lunr.Index.load( data )

        # Load up the JSON Search Data
        $.get '/assets/javascripts/data/search_data.json', ( data ) ->
            window.questions = data.questions.map( ( raw ) ->
                id    : raw.question_id
                title : raw.title
                body  : raw.body
                tags  : raw.tags.join(" ")
            )

        log.timeEnd "Load JSON"

    ##
    # Form Submit
    ##
    formSubmit : ( event ) ->

        # Prevent default
        event.preventDefault()

        # Serialize and save model
        data = $( event.currentTarget ).serializeObject()
        this.model.set data

        # Run the validation and submit
        if @model.isValid( true )

            # Process Results
            results = idx.search( data.search ).map( ( result ) =>
                questions.filter( ( q ) ->
                    q.id is parseInt( result.ref, 10 )
                )[ 0 ]
            )

            # Empty container
            $( ".searchResults" ).empty()

            # Render Template
            htmlstr = ( _.template( @template, qs ) for qs in results )
            $( ".searchResults" ).append htmlstr.join ''

    ##
    # Render
    ##
    render : ->

        # Bind Backbone Validation
        Backbone.Validation.bind this,

            # Valid
            valid : ( view, attr, selector ) =>

                $el    = view.$ "[ name=" + attr + " ]"
                $group = $el.closest ".form-group"
                $group.removeClass "has-error"
                $group.find( ".help-block" ).html( "" ).addClass( "hidden" )

                # Debug
                # log.info "View : ", view, "Attr : ", attr, "Selector : ", selector

            # Invalid
            invalid : ( view, attr, error, selector ) ->

                $el    = view.$ "[ name=" + attr + " ]"
                $group = $el.closest ".form-group"
                $group.addClass "has-error"
                $group.find( ".help-block" ).html( error ).removeClass( "hidden" )

                # Debug
                # log.info "View : ", view, "Attr : ", attr, "error", error, "Selector : ", selector