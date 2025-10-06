import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/authcontroller/forgetpasswordcontroller/otpforgetpasswordcontroller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/textheadauthwidget.dart';

class OtpForgetPassword extends StatelessWidget {
  const OtpForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    OtpForgetPasswordControllerImp controllerImp = Get.put(
      OtpForgetPasswordControllerImp(),
    );
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<OtpForgetPasswordControllerImp>(
          builder: (context) => ViewHandLingData(
            statusRequst: controllerImp.statusRequst,
            widget: Container(
              height: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  TextHeadauthWidget(
                    headtext: "30".tr,
                    bodytext: "31".tr,
                    height: 50,
                  ),
                  OtpTextField(
                    clearText: true,
                    autoFocus: true,
                    // fieldWidth: 100,
                    fieldHeight: 100,
                    fillColor: AppColor.praimarycolor,
                    enabledBorderColor: AppColor.praimarycolor,
                    focusedBorderColor: AppColor.praimarycolor,
                    cursorColor: AppColor.praimarycolor,

                    contentPadding: const EdgeInsets.all(10),
                    numberOfFields: 5,
                    borderColor: AppColor.praimarycolor,
                    showFieldAsBox: true,
                    onSubmit: (value) {
                      controllerImp.verifiAndGoToLogin(value);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
