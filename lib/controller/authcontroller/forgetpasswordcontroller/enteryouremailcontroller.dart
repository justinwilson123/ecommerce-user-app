import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/fotgetpass/enteryouremaildata.dart';

abstract class EnterYourEmailController extends GetxController {
  goToOtpForgetPassword();
}

class EnterYourEmailControllerImp extends EnterYourEmailController {
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  late TextEditingController email;
  StatusRequst statusRequst = StatusRequst.nothing;
  EnterYourEmailData enterYourEmailData = EnterYourEmailData(Get.find());

  @override
  goToOtpForgetPassword() async {
    if (mykey.currentState!.validate()) {
      statusRequst = StatusRequst.loading;

      var response = await enterYourEmailData.getData(email.text);
      statusRequst = handlingData(response);
      if (StatusRequst.success == statusRequst) {
        if (response['status'] == "success") {
          Get.snackbar("41".tr, "42".tr);
          Get.toNamed(
            AppRoutes.otpforgetpassword,
            arguments: {"email": email.text},
          );
        } else {
          Get.defaultDialog(
            title: "50".tr,
            middleText: "55".tr,
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
    email = TextEditingController();
    super.onInit();
  }
}

//     }
