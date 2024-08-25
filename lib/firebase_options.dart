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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyDdBpAVHE3x4PAV-iiLXiQk8bc-1gAhisQ',
    appId: '1:102192060840:web:73cda6b4ab4106ea07a59d',
    messagingSenderId: '102192060840',
    projectId: 'krishiconnect-de9cd',
    authDomain: 'krishiconnect-de9cd.firebaseapp.com',
    storageBucket: 'krishiconnect-de9cd.appspot.com',
    measurementId: 'G-PNSP5705CJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyASlRxjOaUoTbcv-qMbZOOZjhO4MDwrQVY',
    appId: '1:102192060840:android:9d1ee68109e7e9d007a59d',
    messagingSenderId: '102192060840',
    projectId: 'krishiconnect-de9cd',
    storageBucket: 'krishiconnect-de9cd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTKR-8pSVO0Pi2ZLmMr45xi7cKN-DD0vs',
    appId: '1:102192060840:ios:09cd357ade097c9707a59d',
    messagingSenderId: '102192060840',
    projectId: 'krishiconnect-de9cd',
    storageBucket: 'krishiconnect-de9cd.appspot.com',
    iosBundleId: 'com.krishiconnect.krishiConnect',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTKR-8pSVO0Pi2ZLmMr45xi7cKN-DD0vs',
    appId: '1:102192060840:ios:09cd357ade097c9707a59d',
    messagingSenderId: '102192060840',
    projectId: 'krishiconnect-de9cd',
    storageBucket: 'krishiconnect-de9cd.appspot.com',
    iosBundleId: 'com.krishiconnect.krishiConnect',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDdBpAVHE3x4PAV-iiLXiQk8bc-1gAhisQ',
    appId: '1:102192060840:web:3548f74d43c4c73307a59d',
    messagingSenderId: '102192060840',
    projectId: 'krishiconnect-de9cd',
    authDomain: 'krishiconnect-de9cd.firebaseapp.com',
    storageBucket: 'krishiconnect-de9cd.appspot.com',
    measurementId: 'G-H7DFCR680G',
  );
}
