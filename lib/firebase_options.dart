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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_hgn9GmeWlOwQEUJCeMHDhzWrgI3GBmk',
    appId: '1:288540183055:android:39cd92df4161c6d1e3717a',
    messagingSenderId: '288540183055',
    projectId: 'app-conversion-ed72f',
    storageBucket: 'app-conversion-ed72f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1-4z-f121Gm3CL6zzeQ76KjmWm7bCHE0',
    appId: '1:288540183055:ios:c23dcb60a04115bbe3717a',
    messagingSenderId: '288540183055',
    projectId: 'app-conversion-ed72f',
    storageBucket: 'app-conversion-ed72f.appspot.com',
    iosClientId: '288540183055-snkk4emag1rlq0b6h27qsm5o0lq6f8jv.apps.googleusercontent.com',
    iosBundleId: 'com.catonknees.conversion',
  );
}