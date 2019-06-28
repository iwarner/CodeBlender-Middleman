##
# Speech
#
# @author Ian Warner <ian.warner@drykiss.com>
##
class App.Views.Speech extends Backbone.View

    ##
    # Events
    ##
    events :
        "click  .synthesis"   : "synthesis"
        "submit .recognition" : "recognition"

    ##
    # Initialize
    ##
    initialize : ->

        recognition = new webkitSpeechRecognition()

        recognition.continuous     = true
        recognition.interimResults = true


        recognition.onresult = ( event ) ->
            log.info event
            return

        recognition.start()

    ##
    # Recognition
    ##
    recognition : ( event ) ->

        # Prevent default
        event.preventDefault()

        text = $( "input[name='speech']" ).val()

        if text != ""

            log.info "HERE"

    ##
    # Synthesis
    ##
    synthesis : ->

        msg = new SpeechSynthesisUtterance "Hello World"

        voices = window.speechSynthesis.getVoices()

        window.speechSynthesis.speak msg


        # msg.voice = voices[10]; // Note: some voices don't support altering params
        # msg.voiceURI = 'native';
        # msg.volume = 1; // 0 to 1
        # msg.rate = 1; // 0.1 to 10
        # msg.pitch = 2; //0 to 2
        # msg.text = 'Hello World';
        # msg.lang = 'en-US';

        # msg.onend = function(e) {
        #   console.log('Finished in ' + event.elapsedTime + ' seconds.');
        # };

        # speechSynthesis.speak(msg);