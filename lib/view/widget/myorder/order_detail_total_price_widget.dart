import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/myorder/order_details_cotroller.dart';
import 'package:ecommerce/core/constant/color.dart';

class OrderDetailTotalPriceWidget extends GetView<OrderDetailsCotrollerImp> {
  const OrderDetailTotalPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "125".tr,
                  style: const TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${controller.ordersModel!.orderCoupon}",
                  style: const TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "126".tr,
                  style: const TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${controller.ordersModel!.orderPrice}",
                  style: const TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "127".tr,
                  style: const TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${controller.ordersModel!.orderPricedelivery}",
                  style: const TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "128".tr,
                  style: const TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${controller.ordersModel!.orderTotalePrice}",
                  style: const TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
