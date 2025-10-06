import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/cart/check_out_controller.dart';
import 'package:ecommerce/core/constant/color.dart';

class CheckOutChoseDeliveryLocation extends StatelessWidget {
  const CheckOutChoseDeliveryLocation({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutControllerImp());
    return GetBuilder<CheckOutControllerImp>(
      builder: (controller) => controller.delivery == "delivery"
          ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.mylocations.length,
              itemBuilder: (BuildContext context, int i) {
                return Card(
                  color: Colors.white,
                  child: RadioListTile(
                    activeColor: AppColor.praimarycolor,
                    onChanged: (val) {
                      controller.choseLocation(val!);
                    },
                    value: "${controller.mylocations[i].locationId}",
                    groupValue: controller.location,
                    title: Text("${controller.mylocations[i].namelocation}"),
                  ),
                );
              },
            )
          : controller.delivery == "shop"
          ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.ourShope.length,
              itemBuilder: (BuildContext context, int i) {
                return Card(
                  color: Colors.white,
                  child: RadioListTile(
                    activeColor: AppColor.praimarycolor,
                    onChanged: (val) {
                      controller.choseShope(val!);
                    },
                    value: "${controller.ourShope[i].ourshopeId}",
                    groupValue: controller.shop,
                    title: Text("${controller.ourShope[i].ourshopeNameAr}"),
                  ),
                );
              },
            )
          : Container(),
    );
  }
}
