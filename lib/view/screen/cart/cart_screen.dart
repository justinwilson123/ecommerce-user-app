import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/cart/cart_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/items/itemcart/bottom_navigation_bar_cart_widget.dart';
import 'package:ecommerce/view/widget/items/itemcart/coupon_textformfield_widget.dart';
import 'package:ecommerce/view/widget/items/itemcart/list_cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarCartWidget(),
      body: Container(
        color: AppColor.backgroundappcolor,
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Center(
              child: Text(
                "105".tr,
                style: const TextStyle(
                  color: AppColor.praimarycolor,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GetBuilder<CartControllerImp>(
              builder: (controller) => Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.backgroundcolorcontainer,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text("${"106".tr} ${controller.sumitems}")],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const CouponTextformfieldWidget(),
            const ListCartWidget(),
          ],
        ),
      ),
    );
  }
}
