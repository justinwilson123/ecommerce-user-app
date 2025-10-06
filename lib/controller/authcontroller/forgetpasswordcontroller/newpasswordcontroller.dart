import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/fotgetpass/newpassworddata.dart';

abstract class NewPasswordController extends GetxController {
  goToLogin();
  showPassword();
}

class NewPasswordControllerImp extends NewPasswordController {
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController rePassword;
  bool show = true;
  StatusRequst statusRequst = StatusRequst.nothing;
  NewPasswordData newPasswordData = NewPasswordData(Get.find());
  String? email;

  @override
  showPassword() {
    if (show == true) {
      show = false;
    } else {
      show = true;
    }
    update();
  }

  @override
  goToLogin() async {
    if (mykey.currentState!.validate()) {
      statusRequst = StatusRequst.loading;

      var response = await newPasswordData.getData(email!, password.text);
      statusRequst = handlingData(response);
      if (StatusRequst.success == statusRequst) {
        if (response['status'] == "success") {
          Get.snackbar("48".tr, "49".tr);
          Get.offAllNamed(AppRoutes.login);
        } else {
          Get.defaultDialog(
            title: "50".tr,
            middleText: "56".tr,
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
  void onInit() {
    email = Get.arguments["reemail"];
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }
}
