import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/cart/check_out_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/items/itemcart/checkout/check_out_chose_delivery_location.dart';
import 'package:ecommerce/view/widget/items/itemcart/checkout/checkout_bottom_app_bar_widget.dart';
import 'package:ecommerce/view/widget/items/itemcart/checkout/checkout_delivery_chose_widget.dart';
import 'package:ecommerce/view/widget/items/itemcart/checkout/checkout_paymant_widget.dart';
import 'package:ecommerce/view/widget/items/itemcart/checkout/checkout_title_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutControllerImp());
    return Scaffold(
      bottomNavigationBar: const CheckoutBottomAppBarWidget(),
      appBar: AppBar(
        backgroundColor: AppColor.backgroundappcolor,
        title: Text(
          "111".tr,
          style: const TextStyle(color: AppColor.praimarycolor),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: AppColor.backgroundappcolor,
        child: ListView(
          children: [
            Center(child: CheckoutTitleWidget(title: "170".tr)),
            const SizedBox(height: 20),
            CheckoutTitleWidget(title: "171".tr),
            const SizedBox(height: 15),
            const CheckoutPaymantWidget(),
            const SizedBox(height: 15),
            CheckoutTitleWidget(title: "172".tr),
            const SizedBox(height: 10),
            const CheckoutDeliveryChoseWidget(),
            const SizedBox(height: 10),
            const CheckOutChoseDeliveryLocation(),
          ],
        ),
      ),
    );
  }
}
