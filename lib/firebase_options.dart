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
    apiKey: 'AIzaSyA1Bam8eKQRMg_d6ql2E4MAuE2KJqVlxAM',
    appId: '1:684017196182:web:ed571ec95a77411ef236b7',
    messagingSenderId: '684017196182',
    projectId: 'responsive-web-app-4c2eb',
    authDomain: 'responsive-web-app-4c2eb.firebaseapp.com',
    storageBucket: 'responsive-web-app-4c2eb.appspot.com',
    measurementId: 'G-74PSR6PHCD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClAIjsLUI9SZzKfxnIuJGoKpEoXEoHwLE',
    appId: '1:684017196182:android:057264226232443bf236b7',
    messagingSenderId: '684017196182',
    projectId: 'responsive-web-app-4c2eb',
    storageBucket: 'responsive-web-app-4c2eb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxFLdnSyNpIH68XCRBnx7Erq5oYQAk-8U',
    appId: '1:684017196182:ios:79f64d4d62e02896f236b7',
    messagingSenderId: '684017196182',
    projectId: 'responsive-web-app-4c2eb',
    storageBucket: 'responsive-web-app-4c2eb.appspot.com',
    iosClientId: '684017196182-gai5c479mfis4isn6mjqrp2ljrg2v1v2.apps.googleusercontent.com',
    iosBundleId: 'com.example.responsiveWebApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCxFLdnSyNpIH68XCRBnx7Erq5oYQAk-8U',
    appId: '1:684017196182:ios:add679722a77d22af236b7',
    messagingSenderId: '684017196182',
    projectId: 'responsive-web-app-4c2eb',
    storageBucket: 'responsive-web-app-4c2eb.appspot.com',
    iosClientId: '684017196182-vkhijm48j0qso0jhifu1jj9602c9lu7l.apps.googleusercontent.com',
    iosBundleId: 'com.example.responsiveWebApp.RunnerTests',
  );
}
