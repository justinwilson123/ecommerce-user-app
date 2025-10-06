import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/cart/check_out_controller.dart';
import 'package:ecommerce/core/constant/color.dart';

class CheckoutDeliveryChoseWidget extends StatelessWidget {
  const CheckoutDeliveryChoseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutControllerImp());
    return GetBuilder<CheckOutControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.praimarycolor,
                ),
                padding: const EdgeInsets.all(10),
                child: const Icon(Icons.shop, size: 34),
              ),
              Text("115".tr),
              Radio(
                value: "shop",
                groupValue: controller.delivery,
                onChanged: (val) {
                  controller.choseDelevary(val!);
                  controller.getViewShope();
                },
                activeColor: AppColor.praimarycolor,
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.praimarycolor,
                ),
                child: const Icon(Icons.delivery_dining, size: 34),
              ),
              Text("116".tr),
              Radio(
                value: "delivery",
                groupValue: controller.delivery,
                onChanged: (val) {
                  controller.choseDelevary(val!);
                  controller.getDatajson();
                },
                activeColor: AppColor.praimarycolor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
