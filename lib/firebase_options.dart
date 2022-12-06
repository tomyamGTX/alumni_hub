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
    apiKey: 'AIzaSyAMN_8Zhhnkqui9TiMHUgnd3NmBABKKMUQ',
    appId: '1:716738379965:web:6e0136e76678304413f7d4',
    messagingSenderId: '716738379965',
    projectId: 'demoapp-fc6fa',
    authDomain: 'demoapp-fc6fa.firebaseapp.com',
    storageBucket: 'demoapp-fc6fa.appspot.com',
    measurementId: 'G-3M3S3EPWWC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAoh3dZdnDsXXeYERdzoA42KcoKh2n0X3w',
    appId: '1:716738379965:android:8fbbb565a0de0fc313f7d4',
    messagingSenderId: '716738379965',
    projectId: 'demoapp-fc6fa',
    storageBucket: 'demoapp-fc6fa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAA8kPNe_sjKq6WFbWhZ17d0U7PrgpOxZY',
    appId: '1:716738379965:ios:2edc84f9a5c0fcf313f7d4',
    messagingSenderId: '716738379965',
    projectId: 'demoapp-fc6fa',
    storageBucket: 'demoapp-fc6fa.appspot.com',
    iosClientId: '716738379965-etdg89hbervbblpfdq4na3u3o2mj9ol8.apps.googleusercontent.com',
    iosBundleId: 'com.example.alumniHub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAA8kPNe_sjKq6WFbWhZ17d0U7PrgpOxZY',
    appId: '1:716738379965:ios:2edc84f9a5c0fcf313f7d4',
    messagingSenderId: '716738379965',
    projectId: 'demoapp-fc6fa',
    storageBucket: 'demoapp-fc6fa.appspot.com',
    iosClientId: '716738379965-etdg89hbervbblpfdq4na3u3o2mj9ol8.apps.googleusercontent.com',
    iosBundleId: 'com.example.alumniHub',
  );
}