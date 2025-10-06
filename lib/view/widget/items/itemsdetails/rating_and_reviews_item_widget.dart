import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/item/item_detail_controller.dart';
import 'package:ecommerce/core/constant/color.dart';

class RatingAndReviewsItemWidget extends GetView<ItemDetailControllerImp> {
  const RatingAndReviewsItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailControllerImp());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("${"102".tr}: ${controller.itemmodel!.rating}"),
        MaterialButton(
          onPressed: () {
            controller.goToReviewItem();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AppColor.praimarycolor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text("121".tr, style: const TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
