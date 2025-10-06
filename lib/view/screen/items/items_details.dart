import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/item/item_detail_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/view/widget/items/itemsdetails/color_choos_items_widget.dart';
import 'package:ecommerce/view/widget/items/itemsdetails/descr_item_widget.dart';
import 'package:ecommerce/view/widget/items/itemsdetails/name_item_widget.dart';
import 'package:ecommerce/view/widget/items/itemsdetails/price_count_items_widget.dart';
import 'package:ecommerce/view/widget/items/itemsdetails/rating_and_reviews_item_widget.dart';
import 'package:ecommerce/view/widget/items/itemsdetails/stack_image_item_widget.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemDetailControllerImp());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.praimarycolor,
        onPressed: () {
          Get.toNamed(AppRoutes.cartScreen);
        },
        child: const Icon(Icons.shopping_cart_checkout, color: Colors.black),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.,
      body: Container(
        height: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const StackImageItemWidget(),
            const NameItemWidget(),
            GetBuilder<ItemDetailControllerImp>(
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (controller.imagesName.isNotEmpty)
                    MaterialButton(
                      onPressed: () {
                        controller.goToShowMoreItems();
                      },
                      child: const Text("show more image"),
                    ),
                  if (controller.videoNmae != null)
                    MaterialButton(
                      onPressed: () {
                        controller.goToShowVideoItem();
                      },
                      child: const Text("show video"),
                    ),
                ],
              ),
            ),
            const RatingAndReviewsItemWidget(),
            const PriceCountItemsWidget(),
            const SizedBox(height: 15),
            const ColorChoosItemsWidget(),
            const DescrItemWidget(),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
