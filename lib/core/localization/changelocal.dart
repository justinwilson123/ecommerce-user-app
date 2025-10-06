import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/functions/fcm_notification_fun.dart';
import 'package:ecommerce/core/services/servicer.dart';

class LocaleController extends GetxController {
  RxInt countMessaging = 0.obs;
  Locale? language;
  MyService myService = Get.find();
  bool themeMode = false;

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myService.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
    update();
  }

  fontFamily1() {
    String? sharedPrefLang = myService.sharedPreferences.getString("lang");
    if (sharedPrefLang == "en") {
      return "Roboto_Mono";
    } else {
      return "Cairo";
    }
  }

  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("alart", "please turn on location service");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("alart", "please turn on location service");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Get.snackbar("alart", "please turn on location service");
    }
  }

  @override
  void onInit() {
    String? sharedPrefLang = myService.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }

    _determinePosition();
    requestPermissionNotifiction();
    super.onInit();
  }
}
// ThemeData darkTheme = ThemeData.dark().copyWith(
  //   iconTheme: const IconThemeData(color: Colors.red),
  //   buttonTheme: ButtonThemeData(buttonColor: Colors.red),
  //   scaffoldBackgroundColor: Colors.black,
  //   primaryColor: Colors.white,
  // );

  // ThemeData lightTheme = ThemeData.light().copyWith(
  //   buttonTheme: ButtonThemeData(buttonColor: Colors.red),
  //   iconTheme: const IconThemeData(
  //     color: Colors.green,
  //   ),
  //   scaffoldBackgroundColor: Colors.white,
  //   primaryColor: Colors.black,
  // );

  // changeTheme() {
  //   if (Get.isDarkMode) {
  //     myService.sharedPreferences.setString("theme", "light");
  //     returnThemeData();
  //     update();
  //   } else {
  //     myService.sharedPreferences.setString("theme", "dark");
  //     returnThemeData();
  //     update();
  //   }
  // }

  // returnThemeData() {
  //   String? theme = myService.sharedPreferences.getString("theme");
  //   if (theme == null) {
  //     return lightTheme;
  //   } else if (theme == "dark") {
  //     return darkTheme;
  //   } else {
  //     return lightTheme;
  //   }
  // }

  // void _createNotificationChannel() async {
  //   if (Platform.isAndroid) {
  //     final AndroidNotificationChannel channel = AndroidNotificationChannel(
  //       'messaging', // معرف القناة
  //       'message', // اسم القناة
  //       description: 'you have a new message', // وصف القناة
  //       importance: Importance.high,
  //     );

  //     FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //       alert: true,
  //       badge: true,
  //       sound: true,
  //     );
  //     await flutterLocalNotificationsPlugin
  //         .resolvePlatformSpecificImplementation<
  //             AndroidFlutterLocalNotificationsPlugin>()
  //         ?.createNotificationChannel(channel);
  //   }
  // }