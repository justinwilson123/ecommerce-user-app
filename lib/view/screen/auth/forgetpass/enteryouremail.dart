import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/authcontroller/forgetpasswordcontroller/enteryouremailcontroller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/validatorfunction.dart';
import 'package:ecommerce/view/widget/auth/buttonauthwidget.dart';
import 'package:ecommerce/view/widget/auth/textformfieldauthwidget.dart';
import 'package:ecommerce/view/widget/auth/textheadauthwidget.dart';

class EnterYourEmail extends StatelessWidget {
  const EnterYourEmail({super.key});

  @override
  Widget build(BuildContext context) {
    EnterYourEmailControllerImp controllerImp = Get.put(
      EnterYourEmailControllerImp(),
    );
    return Scaffold(
      body: GetBuilder<EnterYourEmailControllerImp>(
        builder: (context) => ViewHandLingData(
          statusRequst: controllerImp.statusRequst,
          widget: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: controllerImp.mykey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextHeadauthWidget(
                      headtext: "37".tr,
                      bodytext: "40".tr,
                      height: 100,
                    ),
                    TextFormFielsAuthWidget(
                      // boxHeight: Get.height / 14,
                      controller: controllerImp.email,
                      validator: (p0) {
                        return validtorFunction(p0!, 11, 30, "email");
                      },
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      hintText: "15".tr,
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: AppColor.praimarycolor,
                      ),
                      height: 20,
                    ),
                    ButtonAuthWidget(
                      buttoncolor: AppColor.praimarycolor,
                      buttontext: "41".tr,
                      textbuttoncolor: Colors.white,
                      horizontal: 50,
                      vertiacl: 2,
                      radius: 10,
                      onPressed: () {
                        controllerImp.goToOtpForgetPassword();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
