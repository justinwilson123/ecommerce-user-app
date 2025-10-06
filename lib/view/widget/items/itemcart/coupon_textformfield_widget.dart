import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/constant/color.dart';

class CouponTextformfieldWidget extends StatelessWidget {
  const CouponTextformfieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CartControllerImp controllerImp = Get.put(CartControllerImp());
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.backgroundcolorcontainer,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                controllerImp.addCouponToCard();
              },
              child: Text(
                "112".tr,
                style: const TextStyle(color: AppColor.praimarycolor),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: TextFormField(
                controller: controllerImp.searshCoupon,
                style: const TextStyle(
                  color: AppColor.praimarycolor,
                  fontSize: 13,
                ),
                cursorHeight: 15,
                scrollPadding: const EdgeInsets.only(top: 1, bottom: 20),
                decoration: InputDecoration(
                  hintText: "113".tr,
                  hintStyle: const TextStyle(color: AppColor.praimarycolor),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
