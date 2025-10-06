import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/linkipa.dart';
import 'package:ecommerce/core/functions/translate_from_sql.dart';

class ListCartWidget extends StatelessWidget {
  const ListCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(
      builder: (controller) => ViewHandLingData(
        statusRequst: controller.statusRequst,
        widget: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.dataview.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 100,
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: CachedNetworkImage(
                        imageUrl:
                            "${Applink.linkImageItem}${controller.dataview[index].itemsImage}",
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "${translateFromSpl(controller.dataview[index].itemsNameAr, controller.dataview[index].itemsNameEn)}",
                          ),
                          Text(
                            "${controller.dataview[index].itemsprices} \$",
                            style: const TextStyle(
                              color: AppColor.praimarycolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                                controller.addcountcart(
                                  controller.dataview[index].itemsId,
                                  (controller.dataview[index].itemsPrice! -
                                      (controller.dataview[index].itemsPrice! *
                                          controller
                                              .dataview[index]
                                              .itemsDiscount! /
                                          100)),
                                  controller.dataview[index].itemsNameEn,
                                  controller.dataview[index].itemsNameAr,
                                  controller.dataview[index].itemsImage,
                                );
                              },
                              icon: const Icon(Icons.add, size: 15),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                "${controller.dataview[index].countitems}",
                                style: const TextStyle(
                                  color: AppColor.praimarycolor,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {
                                controller.removecountcart(
                                  controller.dataview[index].itemsId,
                                );
                              },
                              icon: const Icon(Icons.remove, size: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
