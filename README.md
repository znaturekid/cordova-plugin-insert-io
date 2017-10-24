# Cordova Plugin For Insert Framework


The purpose of this code is to allow hybrid applications to use the native insert SDK. Using the Insert SDK together with this plug-in allows a hybrid app to trigger inserts using custom code.

Register for an insert account at https://insert.io


Adding the Insert SDK to a Cordova app
======================================
* To create a new Cordova app (if needed):

```
cordova create hello com.example.hello HelloWorld

cd hello

cordova platform add ios
cordova platform add android
```
* Add The Insert Plugin:

If you have git installed, run:
```
cordova plugin add https://github.com/znaturekid/cordova-plugin-insert-io.git --save --variable COMPANY_NAME=companyname --variable URL_SCHEMA_IOS=hexvalue --variable API_KEY_FOR_IOS=api_key
```
If git is not installed, download this repository to your machine and run:
```
cordova plugin add <folder-on-your-machine> --save --variable COMPANY_NAME=companyname --variable URL_SCHEMA_IOS=hexvalue --variable API_KEY_FOR_IOS=api_key
```

How to use
==========
- Within the Insert console go to your app and create a custom event (say "userLogin"). 
- Create a new insert and under the Triggers tab use a trigger type of custom event. Select "userLogin" as the event.
- In your javascript code use the following code to trigger the insert:


```
window.plugins.Insert.eventOccurred('userLogin', {});

```

License
=======
The Insert Cordova plug-in is licensed under the Apache 2 license

