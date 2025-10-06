import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/authcontroller/logincontroller/logincontroller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/alerexitapp.dart';
import 'package:ecommerce/core/functions/validatorfunction.dart';
import 'package:ecommerce/view/widget/auth/buttonauthwidget.dart';
import 'package:ecommerce/view/widget/auth/rowbutomwidget.dart';
import 'package:ecommerce/view/widget/auth/textformfieldauthwidget.dart';
import 'package:ecommerce/view/widget/auth/textheadauthwidget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controllerImp = Get.put(LoginControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("32".tr, style: Theme.of(context).textTheme.headlineLarge),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<LoginControllerImp>(
        builder: (context) => WillPopScope(
          onWillPop: alerExitApp,
          child: ViewHandLingData(
            statusRequst: controllerImp.statusRequst,
            widget: Form(
              key: controllerImp.mykey,
              child: Container(
                height: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() {
                        return AnimatedAlign(
                          alignment: controllerImp.alignment.value,
                          duration: const Duration(milliseconds: 750),
                          child: TextHeadauthWidget(
                            headtext: '12'.tr,
                            bodytext: '33'.tr,
                            height: Get.height / 6,
                          ),
                        );
                      }),
                      Obx(() {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 750),
                          width: controllerImp.width.value,
                          child: TextFormFielsAuthWidget(
                            // boxHeight: Get.height / 14,
                            validator: (p0) {
                              return validtorFunction(p0!, 1, 30, "email");
                            },
                            controller: controllerImp.email,
                            obscureText: false,
                            hintText: "15".tr,
                            prefixIcon: const Icon(Icons.email_outlined),
                            keyboardType: TextInputType.emailAddress,
                            height: Get.height / 50,
                          ),
                        );
                      }),
                      Obx(
                        () => AnimatedContainer(
                          duration: Duration(milliseconds: 750),
                          width: controllerImp.width.value,
                          child: TextFormFielsAuthWidget(
                            // boxHeight: Get.height / 14,
                            validator: (p0) {
                              return validtorFunction(p0!, 5, 20, "pass");
                            },
                            controller: controllerImp.password,
                            obscureText: controllerImp.showpass.value,
                            hintText: "17".tr,
                            prefixIcon: IconButton(
                              onPressed: controllerImp.showpassword,
                              icon: controllerImp.showpass.value == false
                                  ? const Icon(Icons.key_outlined)
                                  : const Icon(Icons.key_off_outlined),
                            ),
                            height: Get.height / 14,
                          ),
                        ),
                      ),
                      Obx(() {
                        return AnimatedAlign(
                          alignment: controllerImp.alignmentSignUpButton.value,
                          duration: const Duration(milliseconds: 750),
                          child: ButtonAuthWidget(
                            buttontext: "34".tr,
                            textbuttoncolor: Colors.white,
                            horizontal: 70,
                            vertiacl: 10,
                            radius: 20,
                            buttoncolor: AppColor.praimarycolor,
                            onPressed: () {
                              controllerImp.goToHomePage();
                            },
                          ),
                        );
                      }),
                      SizedBox(height: Get.height / 14),
                      Obx(() {
                        return AnimatedAlign(
                          alignment: controllerImp.alignmentGoogleSingUp.value,
                          duration: const Duration(milliseconds: 750),
                          child: ButtonAuthWidget(
                            buttontext: "35".tr,
                            textbuttoncolor: AppColor.praimarycolor,
                            horizontal: 10,
                            vertiacl: 4,
                            radius: 1,
                            onPressed: () {
                              controllerImp.goToForgetPassword();
                            },
                          ),
                        );
                      }),
                      SizedBox(height: Get.height / 14),
                      RowButtomWidget(
                        text: "36".tr,
                        buttontext: "20".tr,
                        onPressed: () {
                          controllerImp.goTosignUp();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
