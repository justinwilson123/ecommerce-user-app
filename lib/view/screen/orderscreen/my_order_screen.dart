import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/myorder/my_order_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/view/widget/orderwidget/card_my_order_widget.dart';

class MyOrderScreen extends GetView<MyOrderController> {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyOrderController());
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppColor.backgroundappcolor,
      child: ListView(
        children: [
          Image.asset(AppImageAsset.testimage2, height: 300, fit: BoxFit.fill),
          const SizedBox(height: 20),
          CardMyOrderWidget(
            title: "97".tr,
            iconData: Icons.delivery_dining,
            onTap: () {
              controller.goToMyOrderDelivery();
            },
          ),
          CardMyOrderWidget(
            onTap: () {
              controller.goToMyOrderShop();
            },
            title: "96".tr,
            iconData: Icons.shopify_outlined,
          ),
          CardMyOrderWidget(
            title: "98".tr,
            iconData: Icons.archive,
            onTap: () {
              controller.goToMyOrderArchive();
            },
          ),
        ],
      ),
    );
  }
}
