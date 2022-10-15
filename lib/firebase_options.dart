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
    apiKey: 'AIzaSyC2FmHfzpOR0qmFBoFLZh1UccSgXyE_1NE',
    appId: '1:433651648702:android:2bc358c0ddef9799bd36ef',
    messagingSenderId: '433651648702',
    projectId: 'di-cho-nhanh-de44d',
    databaseURL: 'https://di-cho-nhanh-de44d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'di-cho-nhanh-de44d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAWR_1y0K37pPa1QPsE2hXh3KYG9OoCk7I',
    appId: '1:433651648702:ios:e19331cef17b0ad7bd36ef',
    messagingSenderId: '433651648702',
    projectId: 'di-cho-nhanh-de44d',
    databaseURL: 'https://di-cho-nhanh-de44d-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'di-cho-nhanh-de44d.appspot.com',
    iosClientId: '433651648702-tjde20bslsns13ij3qlheekfq8onj8i0.apps.googleusercontent.com',
    iosBundleId: 'com.example.diChoNhanh',
  );
}