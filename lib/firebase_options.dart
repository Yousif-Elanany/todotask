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
    apiKey: 'AIzaSyCJCGz2Y22A-AeY7lpkv1yck8zyk2B5UFQ',
    appId: '1:831694727438:web:ce73e7e522180dfe288f5f',
    messagingSenderId: '831694727438',
    projectId: 'tasks-app-ab70a',
    authDomain: 'tasks-app-ab70a.firebaseapp.com',
    storageBucket: 'tasks-app-ab70a.appspot.com',
    measurementId: 'G-5VXZRVRYYZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxItoU6bYod0Uvwvkzzzq_zDnaWEDg1cE',
    appId: '1:831694727438:android:eafb9b44dfd73e31288f5f',
    messagingSenderId: '831694727438',
    projectId: 'tasks-app-ab70a',
    storageBucket: 'tasks-app-ab70a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEDC5zOonuW-5c2YjXD7VTTuMDHysbENo',
    appId: '1:831694727438:ios:29fc54f2235658f6288f5f',
    messagingSenderId: '831694727438',
    projectId: 'tasks-app-ab70a',
    storageBucket: 'tasks-app-ab70a.appspot.com',
    iosBundleId: 'com.example.todotask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEDC5zOonuW-5c2YjXD7VTTuMDHysbENo',
    appId: '1:831694727438:ios:3dde66aa2ec52573288f5f',
    messagingSenderId: '831694727438',
    projectId: 'tasks-app-ab70a',
    storageBucket: 'tasks-app-ab70a.appspot.com',
    iosBundleId: 'com.example.todotask.RunnerTests',
  );
}
