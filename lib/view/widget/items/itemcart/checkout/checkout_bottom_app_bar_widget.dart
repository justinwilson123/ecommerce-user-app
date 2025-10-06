import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/cart/check_out_controller.dart';
import 'package:ecommerce/core/constant/color.dart';

class CheckoutBottomAppBarWidget extends GetView<CheckOutControllerImp> {
  const CheckoutBottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 50,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      color: AppColor.backgroundappcolor,
      child: Container(
        width: Get.width / 1.05,
        height: 40,
        decoration: BoxDecoration(
          color: AppColor.praimarycolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: MaterialButton(
          onPressed: () {
            controller.getCheckoutOrder();
          },
          child: SizedBox(
            width: double.infinity,
            child: Center(child: Text("114".tr)),
          ),
        ),
      ),
    );
  }
}
