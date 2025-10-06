import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/setting_controller/setting_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controllerImp = Get.put(SettingControllerImp());

    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(7),
      child: ListView(
        children: [
          Container(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  color: AppColor.praimarycolor,
                  height: Get.width / 1.5,
                  child: Image.asset(AppImageAsset.testimage, fit: BoxFit.fill),
                ),
                Positioned(
                  top: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    height: 200,
                    width: 200,
                    padding: const EdgeInsets.all(4),
                    child: ClipOval(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: CachedNetworkImageProvider(
                              Applink.linkImageUser + controllerImp.myImage,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 70),
          // Card(
          //   color: AppColor.backgroundappcolor,
          //   child: ListTile(
          //     title: const Text("Notification"),
          //     leading: const Icon(Icons.notifications_none_outlined),
          //     trailing: Switch(
          //       value: true,
          //       onChanged: (val) {},
          //       activeColor: AppColor.praimarycolor,
          //     ),
          //   ),
          // ),
          Card(
            color: AppColor.backgroundappcolor,
            child: ListTile(
              onTap: () {
                controllerImp.getAccessToken();
              },
              title: Text("76".tr),
              leading: const Icon(Icons.question_mark_outlined),
            ),
          ),
          Card(
            color: AppColor.backgroundappcolor,
            child: ListTile(
              onTap: () {
                controllerImp.goTolocation();
              },
              title: Text("77".tr),
              leading: const Icon(Icons.map_outlined),
            ),
          ),
          Card(
            color: AppColor.backgroundappcolor,
            child: ListTile(
              onTap: () {
                controllerImp.goToConnactUs();
              },
              title: Text("78".tr),
              leading: const Icon(Icons.phone),
            ),
          ),
          Card(
            color: AppColor.backgroundappcolor,
            child: ListTile(
              onTap: () {
                controllerImp.goToChangeLanguage();
              },
              title: Text("79".tr),
              leading: const Icon(Icons.language_outlined),
            ),
          ),
          // Card(
          //   color: AppColor.backgroundappcolor,
          //   child: ListTile(
          //     trailing: MaterialButton(
          //       onPressed: () {
          //         localeController.changeTheme();
          //         Get.offAllNamed(AppRoutes.homescreen);
          //       },
          //       child: Text("theme"),
          //     ),
          // GetBuilder<LocaleController>(
          //   builder: (controller) => Switch(
          //     value: controller.themeMode,
          //     onChanged: (val) {
          //       controllerImp.changTheme(val);
          //     },
          //     activeColor: AppColor.praimarycolor,
          //   ),
          // ),
          //     title: Text("80".tr),
          //     leading: const Icon(Icons.dark_mode_outlined),
          //   ),
          // ),
          Card(
            color: AppColor.backgroundappcolor,
            child: ListTile(
              onTap: () {
                controllerImp.logOut();
                // controlleNot.logout();
              },
              title: Text("81".tr),
              leading: const Icon(Icons.logout_outlined),
            ),
          ),
        ],
      ),
    );
  }
}
