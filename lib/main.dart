import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  /// -- Uncomment this line if you want to use any of features below
  // final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// -- INIT Local Storage

  /// -- Overcome from transparent spaces at the bottom in iOS full Mode, [Use only if needed]
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  /// -- Await Splash until other items Loaded
  /// Note: Make sure to call FlutterNativeSplash.remove();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// -- Initialize Firebase & Authentication Repository if any
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
  //       (FirebaseApp value) => Get.put(AuthenticationRepository()),
  // );

  /// -- Initialize Crashlytics
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  /// -- Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };

  /// -- Main App Starts here...
  runApp(const App());
}
