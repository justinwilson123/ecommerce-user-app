import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/localization/changelocal.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return Scaffold(
      appBar: AppBar(
        title: Text("85".tr),
        centerTitle: true,
        backgroundColor: AppColor.praimarycolor,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: AppColor.backgroundappcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                controller.changeLang("ar");
                Get.offAllNamed(AppRoutes.homescreen);
              },
              child: Card(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: const Text(
                    "عربي",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                controller.changeLang("en");
                Get.offAllNamed(AppRoutes.homescreen);
              },
              child: Card(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: const Text(
                    "English",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
