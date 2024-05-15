// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyASMVQEl02USIuOMFczjvARqAoMC21UFGs',
    appId: '1:90729990051:web:31394a707f70505e06bc16',
    messagingSenderId: '90729990051',
    projectId: 'resortseeker-etr-mad',
    authDomain: 'resortseeker-etr-mad.firebaseapp.com',
    storageBucket: 'resortseeker-etr-mad.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0xT35dtEicpFH0tZZUtL3uBdh8cpGelQ',
    appId: '1:90729990051:android:b5857fde4f042ded06bc16',
    messagingSenderId: '90729990051',
    projectId: 'resortseeker-etr-mad',
    storageBucket: 'resortseeker-etr-mad.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyASMVQEl02USIuOMFczjvARqAoMC21UFGs',
    appId: '1:90729990051:web:f5a5a4554d4e8c7c06bc16',
    messagingSenderId: '90729990051',
    projectId: 'resortseeker-etr-mad',
    authDomain: 'resortseeker-etr-mad.firebaseapp.com',
    storageBucket: 'resortseeker-etr-mad.appspot.com',
  );
}
