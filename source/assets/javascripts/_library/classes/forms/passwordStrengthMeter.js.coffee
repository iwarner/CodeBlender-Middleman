##
# Input File - Password Strength Meter
#
# Core Methods
# .constructor() Used to initialize and setup the Image Previewer
# .bindPasswordStrength() Bind the keyup on input fields with '.password-strength'
# .calcStrength() Calculates the strength of a password
# .updateMeter() Update's the password strength indicator (text and meter)
#
# @author Pratomchai P
##
class App.Classes.PasswordStrengthMeter

    ##
    # Calculates the strength of a password
    #
    # @param string p The password that needs to be calculated
    # @return int intScore The strength score of the password
    ##
    calcStrength : ( password ) ->

        PASSWORD_STRONG           = "STRONG"
        PASSWORD_MEDIUM           = "MEDIUM"
        PASSWORD_WEAK             = "WEAK"
        pwdScore                  = 0
        lowerCaseCharCount        = 0
        upperCaseCharCount        = 0
        numbersCharCount          = 0
        symbolsCharCount          = 0
        middleNumOrSymCount       = 0
        requirementsCount         = 0
        consecutiveUpperCaseCount = 0
        consecutiveLowerCaseCount = 0
        consecutiveNumbersCount   = 0
        seqLettersCount           = 0
        seqNumbersCount           = 0
        seqSymbolsCount           = 0
        repeatCharCount           = 0
        letters                   = "abcdefghijklmnopqrstuvwxyz"
        numbers                   = "01234567890"
        symbols                   = ")!@#$%^&*()"
        upperCaseCharPointer      = null
        lowerCaseCharPointer      = null
        numberCharPointer         = null
        strength                  = "WEAK"

        # Protect from empry username or password
        return PASSWORD_WEAK unless password

        # Loop through password to get number of lowerCase, upperCase, Symbols,
        # and numbers
        pwdIndex = null
        pwdIndex = 0

        while pwdIndex < password.length

            # Look for lowercase letters
            if password[pwdIndex].match( /[a-z]/g )
                consecutiveLowerCaseCount++ if lowerCaseCharPointer isnt null and ( lowerCaseCharPointer + 1 ) is pwdIndex
                lowerCaseCharPointer = pwdIndex
                lowerCaseCharCount++

            # Look for uppercase letters
            else if password[pwdIndex].match( /[A-Z]/g )
                consecutiveUpperCaseCount++ if upperCaseCharPointer isnt null and ( upperCaseCharPointer + 1 ) is pwdIndex
                upperCaseCharPointer = pwdIndex
                upperCaseCharCount++

            # Look for numbers
            else if password[pwdIndex].match( /[0-9]/g )

                # Check if number is a middle number
                consecutiveNumbersCount++ if numberCharPointer isnt null and ( numberCharPointer + 1 ) is pwdIndex
                middleNumOrSymCount++ if pwdIndex > 0 and pwdIndex < password.length - 1
                numberCharPointer = pwdIndex
                numbersCharCount++

            # Look for symbols
            else if password[pwdIndex].match( /[\W]/g )

                # Check if symbol is a symbol number
                middleNumOrSymCount++ if pwdIndex > 0 and pwdIndex < password.length - 1
                symbolsCharCount++

            charIndex = null
            charIndex = pwdIndex + 1

            while charIndex < password.length
                repeatCharCount++ if password[charIndex] is password[pwdIndex]
                charIndex++
            pwdIndex++

        # Requirements Points Check
        if password.length >= 8
            requirementsCount = 1
            requirementsCount = requirementsCount + 1 if symbolsCharCount   > 0
            requirementsCount = requirementsCount + 1 if numbersCharCount   > 0
            requirementsCount = requirementsCount + 1 if upperCaseCharCount > 0
            requirementsCount = requirementsCount + 1 if lowerCaseCharCount > 0

        # Add score for the number of characters in the password
        pwdScore = pwdScore + ( password.length * 4 )

        # Add score for uppercase characters
        pwdScore = pwdScore + ( ( password.length - upperCaseCharCount ) * 2 )  if upperCaseCharCount isnt 0

        # Add score for lowercase characters
        pwdScore = pwdScore + ( ( password.length - lowerCaseCharCount ) * 2 )  if lowerCaseCharCount isnt 0

        # Add score for numbers
        pwdScore = pwdScore + ( numbersCharCount * 4 )

        # Add score for numbers
        pwdScore = pwdScore + ( symbolsCharCount * 6 )

        # Add score for middle numbers and symbols
        pwdScore = pwdScore + ( middleNumOrSymCount * 2 )

        # Add score for mandatory requirements
        pwdScore = pwdScore + ( requirementsCount * 2 ) if requirementsCount >= 4

        # Check if password is only made of letters
        if password.length is ( lowerCaseCharCount + upperCaseCharCount )

            pwdScore = pwdScore - password.length

            if upperCaseCharCount is 0 or lowerCaseCharCount is 0
                pwdScore = pwdScore - ( ( password.length - upperCaseCharCount ) * 2 )
                pwdScore = pwdScore - ( ( password.length - lowerCaseCharCount ) * 2 )

        # Check if password is only made of numbers
        if password.length is numbersCharCount
            pwdScore = pwdScore - ( numbersCharCount * 4 )
            pwdScore = pwdScore - password.length

        # Find Sequential Letters (3+)
        lettersCount = null
        lettersCount = 0

        while lettersCount < ( letters.length - 3 )
            letFwdSequence = letters.substring( lettersCount, lettersCount + 3 )
            letRevSequence = letFwdSequence[ 2 ] + letFwdSequence[ 1 ] + letFwdSequence[ 0 ]
            seqLettersCount++ if password.toLowerCase().indexOf( letFwdSequence ) isnt -1 or password.toLowerCase().indexOf( letRevSequence ) isnt -1
            lettersCount++

        # Find Sequential Numbers (3+)
        numbersCount = null
        numbersCount = 0

        while numbersCount < ( numbers.length - 3 )
            numFwdSequence = numbers.substring( numbersCount, ( numbersCount + 3 ) )
            numRevSequence = numFwdSequence[ 2 ] + numFwdSequence[ 1 ] + numFwdSequence[ 0 ]
            seqNumbersCount++ if password.toLowerCase().indexOf( numFwdSequence ) isnt -1 or password.toLowerCase().indexOf( numRevSequence ) isnt -1
            numbersCount++

        # Find Sequential Symbols (3+)
        symbolsCount = null
        symbolsCount = 0

        while symbolsCount < 8
            symFwdSequence = symbols.substring( symbolsCount, ( symbolsCount + 3 ) )
            symRevSequence = symFwdSequence[ 2 ] + symFwdSequence[ 1 ] + symFwdSequence[ 0 ]
            seqSymbolsCount++ if password.toLowerCase().indexOf( symFwdSequence ) isnt -1 or password.toLowerCase().indexOf( symRevSequence ) isnt -1
            symbolsCount++

        # Deduct point for consecutive uppercase letters
        pwdScore = pwdScore - ( consecutiveUpperCaseCount * 2 )

        # Deduct point for consecutive lowercase letters
        pwdScore = pwdScore - ( consecutiveLowerCaseCount * 2 )

        # Deduct point for consecutive numbers
        pwdScore = pwdScore - ( consecutiveNumbersCount * 2 )

        # Deduct Points for for sequential letters
        pwdScore = pwdScore - (seqLettersCount * 3)

        # Deduct Points for for sequential numbers
        pwdScore = pwdScore - (seqNumbersCount * 3)

        # Deduct Points for for sequential symbols
        pwdScore = pwdScore - ( seqSymbolsCount * 3 )

        # Deduct points for repear character
        pwdScore = pwdScore - ( repeatCharCount * 2 )

        if requirementsCount < 4 or pwdScore <= 40
            strength = PASSWORD_WEAK
        else if pwdScore > 40 and pwdScore <= 60
            strength = PASSWORD_MEDIUM
        else if pwdScore > 60
            strength = PASSWORD_STRONG
        else
            strength = PASSWORD_WEAK

        strength

    ##
    # Update's the password strength indicator ( text and meter )
    # @param obj $field_container
    # @param string passwordStr
    ##
    updateMeter : ( $fieldContainer = false, passwordStr = false ) ->

        $passwordStrengthContainer = $fieldContainer.find '.password-strength-container'
        $passwordText              = $fieldContainer.find '.password-strength-text'
        $passwordMeter             = $fieldContainer.find '.icon'
        $passConfirmField          = $ '#passwordConf'
        pScore                     = @calcStrength passwordStr

        # pScore *= 2

        $passwordStrengthContainer.find( '.password-strength-text' ).hide()
        $passwordStrengthContainer.find( '.password-text' ).hide()
        $passwordText.removeClass( 'password-weak' ).removeClass( 'password-medium' ).removeClass( 'password-strong' )
        $passwordMeter.removeClass( 'icon-password-weak' ).removeClass( 'icon-password-medium' ).removeClass( 'icon-password-strong' )

        # if( pScore < 50 )
        if( pScore == "WEAK" )

            $passwordStrengthContainer.find( '.password-text.weak' ).show()
            $passwordText.addClass( 'password-weak' )
            $passwordMeter.addClass( 'icon-password-weak' )

            # Disable / clear the confirm password field
            $passConfirmField.attr( 'disabled', true ).val('')
            $passConfirmField.next( '.icon' ).hide()

        else if( pScore == "MEDIUM" )

            $passwordStrengthContainer.find( '.password-text.medium' ).show()
            $passwordText.addClass( 'password-medium' )
            $passwordMeter.addClass( 'icon-password-medium' )
            $passConfirmField.attr( 'disabled', false )

        else

            $passwordStrengthContainer.find( '.password-text.strong' ).show()
            $passwordText.addClass( 'password-strong' )
            $passwordMeter.addClass( 'icon-password-strong' )
            $passConfirmField.attr( 'disabled', false )

        # This connects with the Confirmation Field Checker (Not componentised yet TODO)
        # Mbo.ConfirmField.checkConfirmField($passConfirmField)

        # Show or hide pasword strength indicator
        if passwordStr.length > 0
            $passwordStrengthContainer.show()
            $passwordText.show()
        else
            $passwordStrengthContainer.hide()
            $passwordText.hide()
        return