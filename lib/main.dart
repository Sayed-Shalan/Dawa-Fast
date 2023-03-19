import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'db/app_pref.dart';
import 'fcm/fcm_helper.dart';
import 'fcm/local_notifications_helper.dart';
import 'helper/firebase_helper.dart';
import 'theme/app_themes.dart';


FirebaseRemoteConfig firebaseRemoteConfig = FirebaseRemoteConfig.instance;

FirebaseMessaging messaging = FirebaseMessaging.instance;
// FCM background callback
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
}


/// Global Vars ******************************
var pref = Get.put(AppPreferences());
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

/// Start Main ********************************
main() {
  initApp();
}

/// init app
initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  await FirebaseHelper.init();
  await pref.init(); // init GetStorage.
  initFonts();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


  /// init notification ******************************************
  notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  await initLocalNotifications(flutterLocalNotificationsPlugin);


  WidgetsBinding.instance.addPostFrameCallback((_) {
    FCMHelper().requestFCMIOSPermissions();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FCMHelper().onMessageReceived();
    FCMHelper().initRemoteMessage();
    FCMHelper().onTokenChange();
  });


  /// run app
  runApp(const App());
}