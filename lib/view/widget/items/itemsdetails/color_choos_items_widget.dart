import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/item/item_detail_controller.dart';
import 'package:ecommerce/core/constant/color.dart';

class ColorChoosItemsWidget extends StatelessWidget {
  const ColorChoosItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailControllerImp);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            "120".tr,
            style: Theme.of(context).textTheme.headlineLarge,
            // .copyWith(color: AppColor.praimarycolor),
          ),
        ),
        const SizedBox(height: 12),
        GetBuilder<ItemDetailControllerImp>(
          builder: (controller) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // scrollDirection: Axis.horizontal,
            children: [
              ...List.generate(
                controller.colorchose.length,
                (i) => InkWell(
                  onTap: () {
                    controller.chosecolor(i);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: controller.index == i
                          ? AppColor.praimarycolor
                          : Colors.white,
                    ),
                    width: 50,
                    height: 50,
                    child: Center(
                      child: Text(
                        controller.colorchose[i]["name"],
                        style: TextStyle(
                          color: controller.index == i
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
