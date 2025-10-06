import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/localization/changelocal.dart';
import 'package:ecommerce/view/widget/language/buttonlanguagewidget.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("1".tr, style: Theme.of(context).textTheme.headlineLarge),
            ButtonLanguageWidget(
              text: "عربي",
              horizontal: 100,
              onPressed: () {
                controller.changeLang("ar");
                Get.offNamed(AppRoutes.onboarding);
              },
            ),
            const SizedBox(height: 20),
            ButtonLanguageWidget(
              text: "english",
              horizontal: 85,
              onPressed: () {
                controller.changeLang("en");
                Get.offNamed(AppRoutes.onboarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
