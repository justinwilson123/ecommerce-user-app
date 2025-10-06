import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/item/item_detail_controller.dart';
import 'package:ecommerce/core/constant/color.dart';

class PriceCountItemsWidget extends GetView<ItemDetailControllerImp> {
  const PriceCountItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailControllerImp());
    return Row(
      children: [
        Text(
          "${controller.itemmodel!.itemsPriceDiscount} \$",
          style: const TextStyle(
            color: AppColor.praimarycolor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            controller.addcount();
          },
          icon: const Icon(Icons.add),
        ),
        GetBuilder<ItemDetailControllerImp>(
          builder: (contoller) => Text(
            "${controller.count}",
            style: const TextStyle(
              color: AppColor.praimarycolor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            controller.removecount(controller.itemmodel!.itemsId);
          },
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
