import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/functions/upload_files.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup/signupdata.dart';

abstract class SignUpController extends GetxController {
  gotToLogin();
  goToOtpsignup();
  loginWithGoogle();
  showpassword();
  chanageWidthContainer();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController repassword;
  String? userid;
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  SignUpData signUpData = SignUpData(Get.find());
  StatusRequst statusRequst = StatusRequst.nothing;
  Map data = {};
  MyService myService = Get.find();
  File? file;
  RxDouble width = 0.0.obs;
  RxBool showpass = true.obs;

  double widthImage = 0.0;
  double heightImage = 0.0;
  Rx<Alignment> alignment = Alignment.topLeft.obs;
  Rx<Alignment> alignmentSignUpButton = Alignment.topRight.obs;
  Rx<Alignment> alignmentGoogleSingUp = Alignment.topLeft.obs;

  chooseImage() async {
    file = await fileUploadGallery();
    update();
  }

  changeAlignment() {
    alignment.value = Alignment.center;
    alignmentSignUpButton.value = Alignment.center;
    alignmentGoogleSingUp.value = Alignment.center;
  }

  @override
  chanageWidthContainer() {
    width.value = Get.width;
  }

  changeSizeImage() {
    widthImage = 100;
    heightImage = 100;
    update();
  }

  @override
  goToOtpsignup() async {
    print("gotoOtp");
    if (file != null) {
      if (mykey.currentState!.validate()) {
        statusRequst = StatusRequst.loading;
        update();
        var response = await signUpData.postData(
          username.text,
          email.text,
          phone.text,
          password.text,
          file!,
        );
        statusRequst = handlingData(response);
        if (StatusRequst.success == statusRequst) {
          if (response['message'] == "username is using") {
            Get.defaultDialog(
              title: "50".tr,
              middleText: "51".tr,
              textCancel: "52".tr,
              buttonColor: AppColor.praimarycolor,
              backgroundColor: Colors.white,
              cancelTextColor: AppColor.praimarycolor,
              // titleStyle: Theme.of(context).textTheme.bodyMedium,
              // middleTextStyle:
              //     Theme.of(context as BuildContext).textTheme.bodyMedium,
            );
          }
          if (response['message'] == "usermail is using") {
            Get.defaultDialog(
              title: "50".tr,
              middleText: "53".tr,
              textCancel: "52".tr,
              buttonColor: AppColor.praimarycolor,
              backgroundColor: Colors.white,
              cancelTextColor: AppColor.praimarycolor,
            );
          }
          if (response['message'] == "userphone is using") {
            Get.defaultDialog(
              title: "50".tr,
              middleText: "54".tr,
              textCancel: "52".tr,
              buttonColor: AppColor.praimarycolor,
              backgroundColor: Colors.white,
              cancelTextColor: AppColor.praimarycolor,
              // titleStyle: Theme.of(context as BuildContext).textTheme.bodyMedium,
              // middleTextStyle:
              //     Theme.of(context as BuildContext).textTheme.bodyMedium,
            );
          }
          if (response['status'] == "success") {
            Get.snackbar("30".tr, "42".tr);
            Get.toNamed(AppRoutes.otpsignup, arguments: {"email": email.text});
          }
        }
        update();
      }
    } else {
      Get.snackbar("alert", "please choose Image");
    }
  }

  @override
  gotToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();
      if (googleUser == null) {
        return;
      }
      // final GoogleSignInAuthentication? googleAuth =
      //     await googleUser?.authentication;

      statusRequst = StatusRequst.loading;
      // String username = googleUser.email;
      // String username1 = username.replaceAll("@gmail.com", "");
      var response = await signUpData.postDataWithGoogle(
        googleUser.displayName!,
        googleUser.email,
        googleUser.id,
      );
      statusRequst = handlingData(response);
      if (StatusRequst.success == statusRequst) {
        if (response['status'] == "success") {
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
        } else {
          statusRequst = StatusRequst.noData;
        }
      }
      update();
    } catch (e) {
      Get.snackbar("173".tr, "174".tr);
      print("$e");
    }
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
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    repassword = TextEditingController();
    // Future.delayed(Duration(seconds: 1));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      chanageWidthContainer();
      changeSizeImage();
      changeAlignment();
    });
    super.onInit();
  }
}
