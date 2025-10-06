import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/hoempagecontroller/homepagecontroller.dart';
import 'package:ecommerce/core/constant/linkipa.dart';
import 'package:ecommerce/core/functions/translate_from_sql.dart';

class HomePageItemsWidget extends StatelessWidget {
  const HomePageItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomepagecontrollerImp controller = Get.find<HomepagecontrollerImp>();
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.topofferitems.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              controller.goToItemDetail(controller.topofferitems[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(left: 10),
              width: 180,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "${Applink.linkImageItem}${controller.topofferitems[index].itemsImage}",
                    height: 170,
                    width: 170,
                    fit: BoxFit.fill,
                  ),
                  Obx(() {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 750),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black.withOpacity(0.3),
                      ),
                      height: controller.heightCont.value,
                      width: controller.widthCont.value,
                    );
                  }),
                  Positioned(
                    top: 10,
                    right: 5,
                    left: 5,
                    child: Text(
                      "${"67".tr}: ${translateFromSpl(controller.topofferitems[index].itemsNameAr, controller.topofferitems[index].itemsNameEn)} ${controller.topofferitems[index].itemsDiscount}%",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
