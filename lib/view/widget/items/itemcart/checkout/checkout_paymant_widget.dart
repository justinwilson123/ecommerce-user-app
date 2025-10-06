import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/cart/check_out_controller.dart';
import 'package:ecommerce/core/constant/color.dart';

class CheckoutPaymantWidget extends StatelessWidget {
  const CheckoutPaymantWidget({super.key});

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
                child: const Icon(Icons.money_off_rounded, size: 34),
              ),
              Text("117".tr),
              Radio(
                value: "cash",
                groupValue: controller.money,
                onChanged: (val) {
                  controller.chosepayment(val!);
                },
                activeColor: AppColor.praimarycolor,
              ),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.praimarycolor,
                ),
                padding: const EdgeInsets.all(10),
                child: const Icon(Icons.credit_card, size: 34),
              ),
              Text("118".tr),
              Radio(
                value: "card",
                groupValue: controller.money,
                onChanged: (val) {
                  controller.chosepayment(val!);
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
                child: const Icon(Icons.currency_bitcoin, size: 34),
              ),
              Text("119".tr),
              Radio(
                value: "crypto",
                groupValue: controller.money,
                onChanged: (val) {
                  controller.money = val;
                  controller.chosepayment(val!);
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
