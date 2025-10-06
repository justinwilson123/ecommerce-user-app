import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/myorder/order_details_cotroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/translate_from_sql.dart';

class OderDetailItemsAndRatingWidget extends GetView<OrderDetailsCotrollerImp> {
  const OderDetailItemsAndRatingWidget({super.key});

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
                  style: const TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "107".tr,
                  style: const TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "124".tr,
                  style: const TextStyle(
                    color: AppColor.praimarycolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
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
                        "${controller.myOrderDetails[i].sumprice}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: MaterialButton(
                        onPressed: () {
                          controller.itemsFoundOrNot(
                            controller.myOrderDetails[i].cartItemId!,
                            context,
                            controller.myOrderDetails[i].cartItemId!,
                            controller.myOrderDetails[i].itemImageName!,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.praimarycolor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "124".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
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
