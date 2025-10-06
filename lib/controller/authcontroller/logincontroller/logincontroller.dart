import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/auth/login/logindata.dart';

abstract class LoginController extends GetxController {
  void goTosignUp();
  Future<void> goToHomePage();
  void goToForgetPassword();
  void showpassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  LoginData loginData = LoginData(Get.find());
  StatusRequst statusRequst = StatusRequst.nothing;
  MyService myService = Get.find();
  String? userid;
  String? token;
  RxBool showpass = true.obs;
  RxDouble width = 0.0.obs;
  Rx<Alignment> alignment = Alignment.topLeft.obs;
  Rx<Alignment> alignmentSignUpButton = Alignment.topRight.obs;
  Rx<Alignment> alignmentGoogleSingUp = Alignment.topLeft.obs;

  void aniamtedCahnge() {
    width.value = Get.width;
    alignment.value = Alignment.center;
    alignmentSignUpButton.value = Alignment.center;
    alignmentGoogleSingUp.value = Alignment.center;
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.enteremail);
  }

  @override
  goToHomePage() async {
    print("homePage");
    if (mykey.currentState!.validate()) {
      print("validaror");
      statusRequst = StatusRequst.loading;
      token = await FirebaseMessaging.instance.getToken();
      print(token);
      var response = await loginData.getData(email.text, password.text, token!);
      statusRequst = handlingData(response);
      print(statusRequst);
      if (StatusRequst.success == statusRequst) {
        if (response['message'] == "success") {
          myService.sharedPreferences.setString("step", "2");
          myService.sharedPreferences.setString(
            "userid",
            "${response['data']["userid"]}",
          );
          myService.sharedPreferences.setString(
            "username",
            "${response['data']["username"]}",
          );
          myService.sharedPreferences.setString(
            "useremail",
            "${response['data']["useremail"]}",
          );
          myService.sharedPreferences.setString(
            "userphone",
            "${response['data']["userphone"]}",
          );
          myService.sharedPreferences.setString(
            "userdate",
            "${response['data']["userdate"]}",
          );
          myService.sharedPreferences.setString(
            "myimage",
            "${response['data']["image_user"]}",
          );
          userid = myService.sharedPreferences.getString("userid");
          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("user$userid");
          Get.offAllNamed(AppRoutes.homescreen);
        } else if (response['status'] == "success") {
          Get.defaultDialog(
            title: "50".tr,
            middleText: "57".tr,
            textCancel: "52".tr,
            buttonColor: AppColor.praimarycolor,
            backgroundColor: Colors.white,
            cancelTextColor: AppColor.praimarycolor,
            textConfirm: "58".tr,
            onConfirm: () {
              Get.snackbar("30".tr, "42".tr);
              Get.toNamed(AppRoutes.otplogin, arguments: {"email": email.text});
            },
          );
        } else {
          Get.defaultDialog(
            title: "50".tr,
            middleText: "59".tr,
            textCancel: "52".tr,
            buttonColor: AppColor.praimarycolor,
            backgroundColor: Colors.white,
            cancelTextColor: AppColor.praimarycolor,
          );
        }
      }
      update();
    }
  }

  @override
  goTosignUp() {
    Get.offNamed(AppRoutes.signup);
  }

  @override
  showpassword() {
    if (showpass.value == false) {
      showpass.value = true;
    } else {
      showpass.value = false;
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      aniamtedCahnge();
    });
    super.onInit();
  }
}
