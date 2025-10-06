import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/authcontroller/signupcontroller/otpsignupcontroller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/auth/textheadauthwidget.dart';

class OtpSignUp extends StatelessWidget {
  const OtpSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    OtpSignUpControllerImp controllerImp = Get.put(OtpSignUpControllerImp());
    return Scaffold(
      body: GetBuilder<OtpSignUpControllerImp>(
        builder: (context) => SafeArea(
          child: ViewHandLingData(
            statusRequst: controllerImp.statusRequst,
            widget: Container(
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
                    onSubmit: (value) async {
                      await controllerImp.verifiAndGoToLogin(value);
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
