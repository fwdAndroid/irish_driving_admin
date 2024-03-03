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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBD8DnhduNCt7bn3Nlg3c97y0FDlIF0KF4',
    appId: '1:613212709052:android:6b1fde1a83d4e4211930b9',
    messagingSenderId: '613212709052',
    projectId: 'irishdriving-d792f',
    storageBucket: 'irishdriving-d792f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCkSPohwnR5lQisPXNQrTr1fCRjRpzUwJk',
    appId: '1:613212709052:ios:b395b1d98c3b77fd1930b9',
    messagingSenderId: '613212709052',
    projectId: 'irishdriving-d792f',
    storageBucket: 'irishdriving-d792f.appspot.com',
    androidClientId: '613212709052-a5bhq9p81uf7u307atlv4tbt7fkde0fm.apps.googleusercontent.com',
    iosClientId: '613212709052-mb0n3c4cg25oes4fcgrd2epr7l7nll0g.apps.googleusercontent.com',
    iosBundleId: 'com.example.irishDrivingAdmin',
  );
}
