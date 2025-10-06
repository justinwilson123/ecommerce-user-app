import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/authcontroller/signupcontroller/signupcontroller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/functions/alerexitapp.dart';
import 'package:ecommerce/core/functions/validatorfunction.dart';
import 'package:ecommerce/view/widget/auth/buttonauthwidget.dart';
import 'package:ecommerce/view/widget/auth/buttonsignupwithgoogle.dart';
import 'package:ecommerce/view/widget/auth/rowbutomwidget.dart';
import 'package:ecommerce/view/widget/auth/textformfieldauthwidget.dart';
import 'package:ecommerce/view/widget/auth/textheadauthwidget.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controllerImp = Get.put(SignUpControllerImp());
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: GetBuilder<SignUpControllerImp>(
        builder: (context) => WillPopScope(
          onWillPop: alerExitApp,
          child: ViewHandLingData(
            statusRequst: controllerImp.statusRequst,
            widget: Container(
              color: Colors.white,
              // width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(10),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: controllerImp.mykey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() {
                          return AnimatedAlign(
                            alignment: controllerImp.alignment.value,
                            duration: const Duration(milliseconds: 750),
                            child: TextHeadauthWidget(
                              headtext: '12'.tr,
                              bodytext: '13'.tr,
                              height: 20,
                            ),
                          );
                        }),
                        MaterialButton(
                          onPressed: () {
                            controllerImp.chooseImage();
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            child: Stack(
                              alignment: AlignmentDirectional.bottomStart,
                              children: [
                                GetBuilder<SignUpControllerImp>(
                                  builder: (controller) => AnimatedSize(
                                    duration: const Duration(milliseconds: 750),
                                    child: ClipOval(
                                      child: Container(
                                        color: AppColor.praimarycolor,
                                        height: controller.heightImage,
                                        width: controller.widthImage,
                                        padding: EdgeInsets.all(2),
                                        child: ClipOval(
                                          child: Container(
                                            height: controller.heightImage,
                                            width: controller.widthImage,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: controller.file != null
                                                    ? FileImage(
                                                        controller.file!,
                                                      )
                                                    : const AssetImage(
                                                        AppImageAsset
                                                            .testimage2,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.photo_camera,
                                  color: AppColor.praimarycolor,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Obx(() {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 750),
                            width: controllerImp.width.value,
                            child: TextFormFielsAuthWidget(
                              // boxHeight: Get.height / 14,
                              validator: (p0) {
                                return validtorFunction(p0!, 5, 30, "username");
                              },
                              controller: controllerImp.username,
                              obscureText: false,
                              hintText: "14".tr,
                              prefixIcon: const Icon(Icons.person_2_outlined),
                              height: 10,
                            ),
                          );
                        }),
                        Obx(() {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 750),
                            width: controllerImp.width.value,
                            child: TextFormFielsAuthWidget(
                              // boxHeight: Get.height / 14,
                              controller: controllerImp.email,
                              obscureText: false,
                              hintText: "15".tr,
                              prefixIcon: const Icon(Icons.email_outlined),
                              keyboardType: TextInputType.emailAddress,
                              height: 10,
                              validator: (p0) {
                                return validtorFunction(p0!, 11, 30, "email");
                              },
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
                                return validtorFunction(p0!, 7, 30, "phone");
                              },
                              controller: controllerImp.phone,
                              obscureText: false,
                              hintText: "16".tr,
                              prefixIcon: const Icon(
                                Icons.phone_android_outlined,
                              ),
                              keyboardType: TextInputType.phone,
                              height: 10,
                            ),
                          );
                        }),
                        Obx(
                          () => AnimatedContainer(
                            duration: const Duration(milliseconds: 750),
                            width: controllerImp.width.value,
                            child: TextFormFielsAuthWidget(
                              // boxHeight: Get.height / 14,
                              validator: (p0) {
                                return validtorFunction(p0!, 7, 30, "password");
                              },
                              controller: controllerImp.password,
                              obscureText: controllerImp.showpass.value,
                              hintText: "17".tr,
                              prefixIcon: IconButton(
                                onPressed: () {
                                  controllerImp.showpassword();
                                },
                                icon: controllerImp.showpass.value == false
                                    ? const Icon(Icons.key_outlined)
                                    : const Icon(Icons.key_off_outlined),
                              ),
                              height: 10,
                            ),
                          ),
                        ),
                        Obx(
                          () => AnimatedContainer(
                            duration: const Duration(milliseconds: 750),
                            width: controllerImp.width.value,
                            child: TextFormFielsAuthWidget(
                              // boxHeight: Get.height / 14,
                              validator: (p0) {
                                if (controllerImp.password.text == p0) {
                                  return validtorFunction(
                                    p0!,
                                    7,
                                    30,
                                    "password",
                                  );
                                } else {
                                  return "18".tr;
                                }
                              },
                              controller: controllerImp.repassword,
                              obscureText: controllerImp.showpass.value,
                              hintText: "19".tr,
                              prefixIcon: IconButton(
                                onPressed: () {
                                  controllerImp.showpassword();
                                },
                                icon: controllerImp.showpass.value == false
                                    ? const Icon(Icons.key_outlined)
                                    : const Icon(Icons.key_off_outlined),
                              ),
                              height: 10,
                            ),
                          ),
                        ),
                        Obx(() {
                          return AnimatedAlign(
                            alignment:
                                controllerImp.alignmentSignUpButton.value,
                            duration: const Duration(milliseconds: 750),
                            child: ButtonAuthWidget(
                              buttontext: "20".tr,
                              textbuttoncolor: Colors.white,
                              horizontal: 70,
                              vertiacl: 10,
                              radius: 20,
                              buttoncolor: AppColor.praimarycolor,
                              onPressed: () {
                                controllerImp.goToOtpsignup();
                              },
                            ),
                          );
                        }),
                        const SizedBox(height: 10),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Expanded(
                              flex: 4,
                              child: Column(children: [Divider()]),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text("21".tr, textAlign: TextAlign.center),
                            ),
                            const Expanded(
                              flex: 4,
                              child: Column(children: [Divider()]),
                            ),
                          ],
                        ),
                        Obx(() {
                          return AnimatedAlign(
                            alignment:
                                controllerImp.alignmentGoogleSingUp.value,
                            duration: const Duration(milliseconds: 750),
                            child: ButtonSignupWithGoogle(
                              horizontal: 0,
                              vertiacl: 1,
                              radius: 30,
                              onPressed: () {
                                controllerImp.loginWithGoogle();
                              },
                            ),
                          );
                        }),
                        RowButtomWidget(
                          text: "22".tr,
                          buttontext: "23".tr,
                          onPressed: () {
                            controllerImp.gotToLogin();
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
      ),
    );
  }
}
