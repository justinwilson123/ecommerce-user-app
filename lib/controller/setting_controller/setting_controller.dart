import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecommerce/controller/notification/notifiction_not_read_and_read_all_controller.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/get_access_token.dart';
import 'package:ecommerce/core/services/servicer.dart';

abstract class SettingController extends GetxController {
  goTolocation();
  goToChangeLanguage();
  logOut();
  getAccessToken();
  goToConnactUs();
  changTheme(bool val);
}

class SettingControllerImp extends SettingController {
  bool themeMode = false;
  MyService myService = Get.find();
  NotificationNotReadAndReadAllController controlleNot = Get.find();
  late String myImage = myService.sharedPreferences.getString("myimage")!;
  @override
  goTolocation() {
    Get.toNamed(AppRoutes.mylocation);
  }

  @override
  getAccessToken() async {
    GetAccessToken getAccessToken = GetAccessToken();
    String accessToken = await getAccessToken.getAccessToken();
    print(accessToken);
  }

  @override
  logOut() {
    GoogleSignIn googleSignIn = GoogleSignIn.instance;
    googleSignIn.disconnect();
    String userid = myService.sharedPreferences.getString("userid")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("user$userid");
    controlleNot.logout();
    myService.sharedPreferences.clear();

    Get.offAllNamed(AppRoutes.language);
  }

  @override
  goToConnactUs() => Get.toNamed(AppRoutes.connactUs);

  @override
  goToChangeLanguage() => Get.toNamed(AppRoutes.changeLanguge);

  @override
  changTheme(val) {
    if (val == true) {
      themeMode = val;
      Get.changeTheme(ThemeData.dark());
      update();
    } else {
      themeMode = val;
      Get.changeTheme(ThemeData.light());
      update();
    }
  }
}
