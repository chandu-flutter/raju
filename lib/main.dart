import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thandri_sannidhi/Translations/language_translation.dart';

import 'package:thandri_sannidhi/firebase_options.dart';
import 'package:thandri_sannidhi/notification_page.dart';
import 'package:thandri_sannidhi/pages/splash.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.Debug.setAlertLevel(OSLogLevel.none);

  // NOTE: Replace with your own app ID from https://www.onesignal.com
  OneSignal.initialize("5e3e8968-0e50-4f57-8960-8c0aa731891f");

  OneSignal.Notifications.requestPermission(true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GetStorage getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    getStorage.writeIfNull('activeLocal', 'en');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      navigatorKey: navigatorKey,
      // supportedLocales: const [
      //   Locale('en', 'IN'),
      //   Locale('te', 'IN'),
      // ],
      translations: LanguageTranslate(),
      locale: Locale(getStorage.read('activeLocal'), 'IN'),
      fallbackLocale: const Locale('en', 'IN'),
      routes: {
        '/notification_screen': (context) => const NotificationPage(),
      },
    );
  }
}
