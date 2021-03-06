// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCeXo2p5BlSOmD3azBOc3HUpCrMXEyzuV0',
    appId: '1:300257015590:web:e820012da8c98a8ac3b3e7',
    messagingSenderId: '300257015590',
    projectId: 'finalexam4222022',
    authDomain: 'finalexam4222022.firebaseapp.com',
    storageBucket: 'finalexam4222022.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4sUShmnsCb--hCEpp8TEgQXUwwqKMFVY',
    appId: '1:300257015590:android:ed36c931d1246a5ac3b3e7',
    messagingSenderId: '300257015590',
    projectId: 'finalexam4222022',
    storageBucket: 'finalexam4222022.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBaGZzFia1At7J4i9_eoKk4c1lMH3t2neQ',
    appId: '1:300257015590:ios:9cd4fe69c250a2f5c3b3e7',
    messagingSenderId: '300257015590',
    projectId: 'finalexam4222022',
    storageBucket: 'finalexam4222022.appspot.com',
    iosClientId: '300257015590-6e5jtco8b50nbbkjv3chm404sg4go1pl.apps.googleusercontent.com',
    iosBundleId: 'com.jamesleonard.pckicker',
  );
}
