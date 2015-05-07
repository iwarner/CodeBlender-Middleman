##
# Melon JS
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.MelonJS extends Backbone.View

    # Resources
    g_resources = [
        { name: "desert1",          type: "image", src: "assets/data/desert1.png" },
        { name: "desert",           type: "tmx",   src: "assets/data/desert.tmx" },
        { name: "player",           type: "image", src: "assets/data/player_male_base.png" },
        { name: "fog",              type: "image", src: "assets/data/fog.png" },
        { name: "metatiles32x32",   type: "image", src: "assets/data/metatiles32x32.png" }
    ]

    ##
    # Constructor
    ##
    initialize : ->

        # Debug
        log.info "Melon JS"

        # # Create the Game World
        # if not me.video.init('App', 640, 384, false, 1.0)
        #     log.info "Sorry but your browser does not support html 5 canvas."
        #     false

        # # # Set all resources to be loaded
        # me.loader.onload = @loaded

        # # # Set all resources to be loaded
        # me.loader.preload( g_resources )

        # # Load everything & display a loading screen
        # me.state.change( me.state.LOADING )

    ##
    # Loaded
    ##
    loaded : ->

        # Set the "Play/Ingame" Screen Object
        me.state.set( me.state.PLAY, new PlayScreen() )

        # Add our player entity in the entity pool
        me.entityPool.add( "player", PlayerEntity )

        # Enable the keyboard
        me.input.bindKey( me.input.KEY.LEFT,  "left" )
        me.input.bindKey( me.input.KEY.RIGHT, "right" )
        me.input.bindKey( me.input.KEY.UP,    "up" )
        me.input.bindKey( me.input.KEY.DOWN,  "down" )

        # Show HitBox
        me.debug.renderHitBox = true

        # Start the game
        me.state.change( me.state.PLAY )

# # The in game stuff
# PlayScreen = me.ScreenObject.extend

    onResetEvent : ->

        # Debug
        log.info "Play Screen"

        # Stuff to reset on state change
        me.levelDirector.loadLevel( "desert" )

    onDestroyEvent : ->

##
#
##
# Character = me.ObjectEntity.extend

#     init : (x, y, settings) ->

#         log.info "character"

#         # call the parent constructor
#         this.parent(x, y, settings)

#         # set the walking speed
#         this.setVelocity(2.5, 2.5)

#         this.setFriction(0.2, 0.2)

#         # adjust the bounding box
#         this.updateColRect(20,24, 44, 16)

#         # disable gravity
#         this.gravity = 0

#         this.firstUpdates = 2
#         this.direction    = 'down'
#         this.destinationX = x
#         this.destinationY = y

#         this.addAnimation("stand-down", [0])
#         this.addAnimation("stand-left", [7])
#         this.addAnimation("stand-up", [14])
#         this.addAnimation("stand-right", [21])
#         this.addAnimation("down", [1,2,3,4,5,6])
#         this.addAnimation("left", [8,9,10,11,12,13])
#         this.addAnimation("up", [15,16,17,18,19,20])
#         this.addAnimation("right", [22,23,24,25,26,27])

#     update : ->

#         hadSpeed = this.vel.y != 0 || this.vel.x != 0

#         this.handleInput()

#         # check & update player movement
#         updated = this.updateMovement()

#         if this.vel.y == 0 && this.vel.x == 0

#             this.setCurrentAnimation('stand-' + this.direction)

#             if hadSpeed
#                 updated = true

#         # update animation
#         if updated

#             # update object animation
#             this.parent(this)

#         return updated

#     handleInput : ->

#         if this.destinationX < this.pos.x - 10

#             this.vel.x -= this.accel.x * me.timer.tick
#             this.setCurrentAnimation('left')
#             this.direction = 'left'

#         else if this.destinationX > this.pos.x + 10

#             this.vel.x += this.accel.x * me.timer.tick
#             this.setCurrentAnimation('right')
#             this.direction = 'right'

#         if this.destinationY < this.pos.y - 10

#             this.vel.y = -this.accel.y * me.timer.tick
#             this.setCurrentAnimation('up')
#             this.direction = 'up'

#         else if this.destinationY > this.pos.y + 10

#             this.vel.y = this.accel.y * me.timer.tick
#             this.setCurrentAnimation('down')
#             this.direction = 'down'

# PlayerEntity = me.ObjectEntity.extend

    init : (x, y, settings) ->

        log.info "Player Entity"

        this.parent(x, y, settings);
        me.game.viewport.follow(this.pos, me.game.viewport.AXIS.BOTH);

    update: ->

        this.updateMovement();

        if (this.vel.x!=0 || this.vel.y!=0)
            this.parent(this);
            true

    false

##
#
##
# PlayerEntity = Character.extend

#     init : (x, y, settings) ->

#         log.info "Player Entity"

#         # call the parent constructor
#         this.parent(x, y, settings)

#         # set the display to follow our position on both axis
#         # me.game.viewport.follow(this.pos, me.game.viewport.AXIS.BOTH)

#         # me.ObjectSettings.spritewidth  = 64
#         # me.ObjectSettings.spriteheight = 64
#         # me.ObjectSettings.image        = "player_male_base"

#         # otherPlayers[player.id]   = new Character(player.x, player.y, me.ObjectSettings)
#         # otherPlayers[player.id].z = 3

#         # me.game.add(otherPlayers[player.id])
#         # me.game.sort()

#         # localPlayerCreated(this)

#     handleInput : ->

#         if me.input.isKeyPressed('left')

#             this.vel.x -= this.accel.x * me.timer.tick
#             this.setCurrentAnimation('left')
#             this.direction = 'left'

#         else if me.input.isKeyPressed('right')

#             this.vel.x += this.accel.x * me.timer.tick
#             this.setCurrentAnimation('right')
#             this.direction = 'right'

#         if me.input.isKeyPressed('up')

#             this.vel.y = -this.accel.y * me.timer.tick
#             this.setCurrentAnimation('up')
#             this.direction = 'up'

#         else if me.input.isKeyPressed('down')

#             this.vel.y = this.accel.y * me.timer.tick
#             this.setCurrentAnimation('down')
#             this.direction = 'down'