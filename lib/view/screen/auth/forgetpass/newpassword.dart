import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/authcontroller/forgetpasswordcontroller/newpasswordcontroller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/validatorfunction.dart';
import 'package:ecommerce/view/widget/auth/buttonauthwidget.dart';
import 'package:ecommerce/view/widget/auth/textformfieldauthwidget.dart';
import 'package:ecommerce/view/widget/auth/textheadauthwidget.dart';

class Newpassword extends StatelessWidget {
  const Newpassword({super.key});

  @override
  Widget build(BuildContext context) {
    NewPasswordControllerImp controllerImp = Get.put(
      NewPasswordControllerImp(),
    );
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<NewPasswordControllerImp>(
          builder: (context) => ViewHandLingData(
            statusRequst: controllerImp.statusRequst,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: controllerImp.mykey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextHeadauthWidget(
                        headtext: "37".tr,
                        bodytext: "38".tr,
                        height: 100,
                      ),
                      GetBuilder<NewPasswordControllerImp>(
                        builder: (context) => TextFormFielsAuthWidget(
                          // boxHeight: Get.height / 14,
                          controller: controllerImp.password,
                          validator: (p0) {
                            return validtorFunction(p0!, 6, 20, "password");
                          },
                          obscureText: controllerImp.show,
                          hintText: "17".tr,
                          prefixIcon: IconButton(
                            onPressed: () {
                              controllerImp.showPassword();
                            },
                            icon: controllerImp.show == false
                                ? const Icon(Icons.key_outlined)
                                : const Icon(Icons.key_off_outlined),
                          ),
                          height: 10,
                        ),
                      ),
                      GetBuilder<NewPasswordControllerImp>(
                        builder: (context) => TextFormFielsAuthWidget(
                          // boxHeight: Get.height / 14,
                          controller: controllerImp.rePassword,
                          validator: (p0) {
                            if (controllerImp.password.text == p0) {
                              return validtorFunction(p0!, 6, 20, "password");
                            } else {
                              return "18".tr;
                            }
                          },
                          obscureText: controllerImp.show,
                          hintText: "19".tr,
                          prefixIcon: IconButton(
                            onPressed: () {
                              controllerImp.showPassword();
                            },
                            icon: controllerImp.show == false
                                ? const Icon(Icons.key_outlined)
                                : const Icon(Icons.key_off_outlined),
                          ),
                          height: 20,
                        ),
                      ),
                      ButtonAuthWidget(
                        buttoncolor: AppColor.praimarycolor,
                        buttontext: "39".tr,
                        textbuttoncolor: Colors.white,
                        horizontal: 50,
                        vertiacl: 2,
                        radius: 10,
                        onPressed: () {
                          controllerImp.goToLogin();
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
