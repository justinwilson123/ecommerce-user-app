import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/constant/color.dart';

class BottomNavigationBarCartWidget extends StatelessWidget {
  const BottomNavigationBarCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(
      builder: (controller) => BottomAppBar(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
        color: Colors.white,
        height: 155,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("107".tr),
                const Spacer(),
                Text("${controller.totaleprices} \$"),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("108".tr),
                const Spacer(),
                Text("${controller.discountCoupon} %"),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text("109".tr), const Spacer(), const Text("0 \$")],
            ),
            const Divider(),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("110".tr),
                const Spacer(),
                Text("${controller.getTotalePrices()} \$"),
              ],
            ),
            const Spacer(),
            Container(
              width: Get.width / 1.05,
              height: 40,
              decoration: BoxDecoration(
                color: AppColor.praimarycolor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: MaterialButton(
                onPressed: () {
                  controller.goToCheckoutPage();
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Center(child: Text("111".tr)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
