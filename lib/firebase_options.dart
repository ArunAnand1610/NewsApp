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
    apiKey: 'AIzaSyDf5WIkPewDpd17lyTdQMA-ItUmeTwpd6o',
    appId: '1:580609860481:web:66535edec48c3dbe1bfe80',
    messagingSenderId: '580609860481',
    projectId: 'firstsocialapp-3d902',
    authDomain: 'firstsocialapp-3d902.firebaseapp.com',
    storageBucket: 'firstsocialapp-3d902.appspot.com',
    measurementId: 'G-K7HVTM534H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDBYcWQqv6bLIVl6NKCZiwxZ4-hfLUjDo',
    appId: '1:580609860481:android:96c73e946d14bdc01bfe80',
    messagingSenderId: '580609860481',
    projectId: 'firstsocialapp-3d902',
    storageBucket: 'firstsocialapp-3d902.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZ2ZuwX3LJz6dfuotUIUJqcjzGR-oAbIA',
    appId: '1:580609860481:ios:ffa24f6d8ca4059a1bfe80',
    messagingSenderId: '580609860481',
    projectId: 'firstsocialapp-3d902',
    storageBucket: 'firstsocialapp-3d902.appspot.com',
    iosClientId: '580609860481-g1orak6dpalcr735s3hs03g1bti9mora.apps.googleusercontent.com',
    iosBundleId: 'com.example.fluttersocialApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAZ2ZuwX3LJz6dfuotUIUJqcjzGR-oAbIA',
    appId: '1:580609860481:ios:ffa24f6d8ca4059a1bfe80',
    messagingSenderId: '580609860481',
    projectId: 'firstsocialapp-3d902',
    storageBucket: 'firstsocialapp-3d902.appspot.com',
    iosClientId: '580609860481-g1orak6dpalcr735s3hs03g1bti9mora.apps.googleusercontent.com',
    iosBundleId: 'com.example.fluttersocialApp',
  );
}