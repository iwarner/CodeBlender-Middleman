---

heading :
    small : ""
    title : "Apple certificate"

meta :
    author : "Ian Warner"
    image  : ""
    title  : "Apple certificate"
    type   : ""

category : "business"
date     : 2014-01-20
excerpt  : "Apple certificate"
modified : 2014-02-09
tags     : [ apple ]

---

# APPLE CERTIFICATES

Join the Apple Developer Program - https://developer.apple.com/programs/register/

# Register the Device ID

* Connect the device
    * Click the device to get the summary
    * Click the Serial Number to bring up the UDID
    * Use CMD+C to copy the UDID to the clipboard

* Log into the Apple provisioning portal - https://developer.apple.com/ios/manage/overview/index.action

* Generate a Certificate Signing Request (CSR) file (*.certSigningRequest).
    ** You generate a CSR to obtain an iOS developer/distribution certificate.
    ** You can generate a CSR by using Keychain Access on Mac or OpenSSL on Windows.
    ** When you generate a CSR you only provide your user name and email address;
    ** Generating a CSR creates a public key and a private key as well as a *.certSigningRequest file.
    ** The public key is included in the CSR, and the private key is used to sign the request.
        *** http://help.adobe.com/en_US/as3/iphone/WS144092a96ffef7cc-371badff126abc17b1f-8000.html
    ** Open Keychain Access.
    ** On the Keychain Access menu, select Preferences.
    ** In the Preferences dialog box, click Certificates
        *** Set Online Certificate Status Protocol and Certificate Revocation List to Off.
    ** On the Keychain Access menu, select Certificate Assistant > Request a Certificate from a Certificate Authority.
        *** Enter the e-mail address and name that matches your iPhone developer account ID.
        *** Do not enter a CA e-mail address.
        *** Select Request is Saved to Disk and then click the Continue button.
        *** Save the file (CertificateSigningRequest.certSigningRequest).

* Generate an iOS developer certificate or an iOS distribution certificate (*.cer), as required.
    ** Note: To deploy an application to a device, you need a developer certificate.
    To deploy the application to the Apple App Store, you need a distribution certificate.

* Generate an iOS developer certificate
    ** Log in to the iOS Provisioning Portal using your Apple ID, and select the Development tab.
    ** Click Request Certificate and browse to the CSR file that you generated and saved on your computer (step 3).
    ** Select the CSR file and click Submit.
    ** On the Certificates page, click Download.
    ** Save the downloaded file (*.developer_identity.cer).

* Generate an iOS distribution certificate
    ** Log in to the iOS Provisioning Portal using your Apple ID, and select the Distribution tab
    ** Click Request Certificate and browse to the CSR file that you generated and saved on your computer (step 3).
    ** Select the CSR file and click Submit.
    ** On the Certificates page, click Download.
    ** Save the downloaded file (*.distribution_identity.cer).

* Convert the iOS developer certificate or the iOS distribution certificate to a P12 file format (*.p12).
    ** You convert the iOS developer or iOS distribution certificate to a P12 format so that Flash Builder can digitally sign your iOS application.
    ** Converting to a P12 format combines your iOS developer/distribution certificate and the associated private key into a single file.
        *** Note: If you are testing the application on the desktop using the AIR Debug Launcher (ADL), you don’t have to convert the iOS developer/distribution certificate into a P12 format.
    ** Use Keychain Access on Mac or OpenSSL on Windows to generate a Personal Information Exchange (*.p12) file.

    ** Convert the iPhone developer certificate to a P12 file on Mac OS
    ** Once you have downloaded the Apple iPhone certificate from Apple, export it to the P12 certificate format.
        *** Open the Keychain Access application (in the Applications/Utilities folder).
        *** If you have not already added the certificate to Keychain, select File > Import.
        *** Navigate to the certificate file (the .cer file) you obtained from Apple.
        *** Select the Keys category in Keychain Access.
        *** Select the private key associated with your iPhone Development Certificate.
        *** The private key is identified by the iPhone Developer: <First Name> <Last Name> public certificate that is paired with it. Select File > Export Items.
        *** Save your key in the Personal Information Exchange (.p12) file format.
        *** You will be prompted to create a password that is used when you attempt to import this key on another computer.

* Generate the Application ID by following these steps:
    ** Log in to the iOS Provisioning Portal using your Apple ID.
    ** Go to the App IDs page, and click New App ID.
    ** In the Manage tab, enter a description for your application
    ** Generate a new Bundle Seed ID, and enter a Bundle Identifier.
    ** Every application has a unique Application ID, which you specify in the application descriptor XML file.
    ** An Application ID consists of a ten-character "Bundle Seed ID" that Apple provides and a "Bundle Identifier" suffix that you specify.
    ** The Bundle Identifier you specify must match the application ID in the application descriptor file.
    ** For example, if your Application ID is com.myDomain.*, the ID in the application descriptor file must start with com.myDomain.
    ** Important: Wildcard Bundle Identifiers are good for developing and testing iOS applications but can't be used to deploy applications to the Apple App Store.

* Generate a Developer Provisioning Profile file or a Distribution Provisioning Profile File (*.mobileprovision).
    ** Note: To deploy an application to a device, you need a Developer Provisioning Profile.
    ** To deploy the application to the Apple App Store, you need a Distribution Provisioning Profile.
    ** You use a Distribution Provisioning Profile to sign your application.
    ** Generate a Developer Provisioning Profile
        *** Log in to the iOS Provisioning Portal using your Apple ID.
        *** Go to Certificate > Provisioning, and click New Profile.
        *** Enter a profile name, select the iOS developer certificate, the App ID, and the UDIDs on which you want to install the application.
        *** Download the generated Developer Provisioning Profile file (*.mobileprovision)and save it on your computer.

* Add Provisioning file to Itune
    ** In iTunes, select File > Add To Library, and browse to the mobile provisioning profile file (.mobileprovision filename extension)
    ** In iTunes, select File > Add To Library, and browse to the debug IPA file.
    ** Sync your iOS device with iTunes by selecting File > Sync.