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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD-vnm5UHJhwOqPzX8u7iR8fjCBTiDPC1Y',
    appId: '1:202708943429:web:5c3e523736a5f2a791992c',
    messagingSenderId: '202708943429',
    projectId: 'blog-app-716b4',
    authDomain: 'blog-app-716b4.firebaseapp.com',
    storageBucket: 'blog-app-716b4.firebasestorage.app',
    measurementId: 'G-10968VE1K2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQyjEdAVtqoGHiT8Rf_BaQ0IyCAEDw12M',
    appId: '1:202708943429:android:70cbb14238459bc891992c',
    messagingSenderId: '202708943429',
    projectId: 'blog-app-716b4',
    storageBucket: 'blog-app-716b4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMlqJGEvss_9atLOZD9eEk6Nn4Qssq60s',
    appId: '1:202708943429:ios:8c744e60ddceb2e691992c',
    messagingSenderId: '202708943429',
    projectId: 'blog-app-716b4',
    storageBucket: 'blog-app-716b4.firebasestorage.app',
    iosBundleId: 'com.example.blogApp',
  );
}
