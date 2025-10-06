import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/hoempagecontroller/homepagecontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/translate_from_sql.dart';

class Homepageofferwidget extends StatelessWidget {
  const Homepageofferwidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomepagecontrollerImp controller = Get.find<HomepagecontrollerImp>();
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.cashback.length,
        itemBuilder: (context, i) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.backgroundcolorcontainer,
                  ),
                  width: context.isLandscape
                      ? Get.width / 1.1
                      : Get.width / 1.1,
                  height: 200,
                ),
                Positioned(
                  left: controller.lang == "ar" ? -20 : null,
                  right: controller.lang == "en" ? -20 : null,
                  top: -20,
                  child: Obx(() {
                    return AnimatedSize(
                      duration: Duration(milliseconds: 750),
                      child: Container(
                        height: controller.heightContCtack.value,
                        width: controller.widthContContStack.value,
                        decoration: BoxDecoration(
                          color: AppColor.praimarycolor,
                          borderRadius: BorderRadius.circular(150),
                        ),
                      ),
                    );
                  }),
                ),
                Positioned(
                  right: controller.lang == "ar" ? 20 : null,
                  left: controller.lang == "en" ? 20 : null,
                  top: 20,
                  child: SizedBox(
                    width: Get.width / 1.3,
                    height: 160,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${translateFromSpl(controller.cashback[i].titleAr, controller.cashback[i].titleEn)}",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "${translateFromSpl(controller.cashback[i].bodyAr, controller.cashback[i].bodyEn)}",
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
