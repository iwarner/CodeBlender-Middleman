##
# Database
##
class App.Utils.Database

    ##
    # Constructor
    #
    # @param Object Database setup
    ##
    constructor : ( database ) ->

        @options = database

    ##
    # Connection
    ##
    connection : ->

        # Connection
        @conn = openDatabase @options.name, @options.version, @options.description, @options.size

        # Setup
        @conn.transaction @setup

        return false

    ##
    # Save
    ##
    save : ( id, name, callback ) ->

        @id       = id
        @name     = name
        @callback = callback

        @conn.transaction @insert1 @success error

    ##
    # Insert1
    ##
    insert1 : ( tx ) =>

        tx.executeSql 'INSERT INTO case_studies ( id, name ) VALUES ( ?, ? )', [ @id, @name ]

    ##
    # Fetch All
    ##
    fetchAll : ( callback ) ->

        @callback = callback
        @conn.transaction @getAll

    ##
    # Fetch One
    ##
    fetchOne : ( url, callback ) ->

        @url      = url
        @callback = callback
        @conn.transaction @getOne

    ##
    # Destroy
    ##
    clear : (  callback ) ->

        @callback = callback
        @conn.transaction @destroy

    ##
    # Remove
    ##
    remove : ( id, callback ) ->

        @id       = id
        @callback = callback
        @conn.transaction @delete

    ##
    # Setup
    ##
    setup : ( tx ) =>

        tx.executeSql 'CREATE TABLE IF NOT EXISTS case_studies ( id INTEGER PRIMARY KEY, name )'

    ##
    # Insert
    ##
    insert : ( tx ) =>

        tx.executeSql 'INSERT INTO case_studies ( id, name ) VALUES ( ?, ? )', [ @id, @name ], @callback, @error

    ##
    # Get All
    ##
    getAll : ( tx ) =>

        tx.executeSql 'SELECT * FROM case_studies', [], @callback

    ##
    # Get One
    ##
    getOne : ( tx ) =>

        tx.executeSql 'SELECT * FROM case_studies WHERE url = ?', [@url], @callback, @error

    ##
    # Setup
    ##
    destroy : ( tx ) =>

        tx.executeSql 'DELETE FROM case_studies', [], @fetchAll( @callback ), @error

    ##
    # Delete
    ##
    delete : ( tx ) =>

        tx.executeSql 'DELETE FROM case_studies WHERE id = ?', [ @id ], @fetchAll( @callback ), @error

    ##
    # Success
    ##
    success : ( message ) ->

        # Debug
        log.info message
        return true

    ##
    # Error
    ##
    error : ( err ) ->

        # Debug
        log.info "DB Error: " + err.message + " - Code=" + err.code
        return false