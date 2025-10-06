import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/item/item_detail_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class StackImageItemWidget extends GetView<ItemDetailControllerImp> {
  const StackImageItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailControllerImp());
    return Stack(
      alignment: Alignment.topCenter,
      fit: StackFit.passthrough,
      children: [
        Container(height: 250),
        Container(
          height: 100,
          decoration: const BoxDecoration(
            color: AppColor.praimarycolor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        Positioned(
          top: 50,
          child: Hero(
            tag: "${controller.itemmodel!.itemsId}",
            child: Container(
              height: 200,
              child: CachedNetworkImage(
                height: 200,
                // fit: BoxFit.fill,
                imageUrl:
                    "${Applink.linkImageItem}${controller.itemmodel!.itemsImage}",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
