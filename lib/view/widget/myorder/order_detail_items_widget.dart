import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/myorder/order_details_cotroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/translate_from_sql.dart';

class OrderDetailItemsWidget extends GetView<OrderDetailsCotrollerImp> {
  const OrderDetailItemsWidget({super.key});

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
                  "122".tr,
                  style: const TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "123".tr,
                  style: TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "107".tr,
                  style: TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "175".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.myOrderDetails.length,
              itemBuilder: (context, i) {
                return Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${translateFromSpl(controller.myOrderDetails[i].itemNameAr, controller.myOrderDetails[i].itemNameEn)}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${controller.myOrderDetails[i].sumitems}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${controller.myOrderDetails[i].itemPrice}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${controller.myOrderDetails[i].sumprice}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
