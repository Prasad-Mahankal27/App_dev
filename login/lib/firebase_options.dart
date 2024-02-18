// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAz-KxrRvOjlXLdw4S9CUil7H-3dBxUqaE',
    appId: '1:499447915139:web:eb79be6522ca07743331b6',
    messagingSenderId: '499447915139',
    projectId: 'login-5d977',
    authDomain: 'login-5d977.firebaseapp.com',
    storageBucket: 'login-5d977.appspot.com',
    measurementId: 'G-BTVC9LSV2J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmAGijSfiddwj_q1IVaGEQaAy-D7IyySc',
    appId: '1:499447915139:android:9abcd1ade54d477f3331b6',
    messagingSenderId: '499447915139',
    projectId: 'login-5d977',
    storageBucket: 'login-5d977.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhhNwDEHpD2YsP58LoZv0tyy4TMiLGGO0',
    appId: '1:499447915139:ios:ec3750ec77cba3163331b6',
    messagingSenderId: '499447915139',
    projectId: 'login-5d977',
    storageBucket: 'login-5d977.appspot.com',
    iosBundleId: 'com.example.login',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhhNwDEHpD2YsP58LoZv0tyy4TMiLGGO0',
    appId: '1:499447915139:ios:c8340084bc4f00c83331b6',
    messagingSenderId: '499447915139',
    projectId: 'login-5d977',
    storageBucket: 'login-5d977.appspot.com',
    iosBundleId: 'com.example.login.RunnerTests',
  );
}
