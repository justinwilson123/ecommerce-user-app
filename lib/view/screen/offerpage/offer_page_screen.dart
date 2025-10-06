import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/favorite/favorite_controller.dart';
import 'package:ecommerce/controller/itemsofferpage/items_offer_page_controller.dart';
import 'package:ecommerce/core/class/view_status_requset.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/offerpage/list_items_offer_widget.dart';

class OfferPageScreen extends GetView<ItemsOfferPageControllerImp> {
  const OfferPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsOfferPageControllerImp controller = Get.put(
      ItemsOfferPageControllerImp(),
    );
    FavoriteController controllerfav = Get.put(FavoriteController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            controller.goToFavoriteItems();
          },
          icon: const Icon(Icons.favorite),
        ),
        title: Text("75".tr),
        centerTitle: true,
        backgroundColor: AppColor.praimarycolor,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: AppColor.backgroundappcolor,
        child: Obx(() {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if ((controller.offeritems.length >= 10) &&
                  !controller.isLoading.value &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                controller.getOfferItem();
              }
              return true;
            },
            child: RefreshIndicator(
              onRefresh: () async {
                controller.offeritems.clear();
                controller.page(1);
                controller.getOfferItem();
              },
              child: MasonryGridView.count(
                crossAxisCount: controller.offeritems.isEmpty
                    ? 1
                    : context.isLandscape
                    ? 4
                    : 2,
                mainAxisSpacing: 3,
                crossAxisSpacing: 3,
                itemCount: controller.offeritems.isEmpty
                    ? 1
                    : controller.offeritems.length +
                          (controller.isLoading.value ? 1 : 0),
                itemBuilder: (context, index) {
                  if (controller.offeritems.isNotEmpty &&
                      !controller.isLoading.value) {
                    controllerfav.favoriteitems[controller
                            .offeritems[index]
                            .itemsId] =
                        controller.offeritems[index].favoriteactiv;
                  }
                  if (index >= controller.offeritems.length &&
                      controller.offeritems.isNotEmpty) {
                    return ViewStatusRequset(
                      statusRequst: controller.statusRequst.value,
                      size: 40,
                      height: null,
                    );
                  }
                  return controller.offeritems.isEmpty
                      ? GetBuilder<ItemsOfferPageControllerImp>(
                          builder: (controller) => ViewStatusRequset(
                            statusRequst: controller.statusRequst.value,
                            size: 250,
                            height: Get.height - (Get.height / 6),
                          ),
                        )
                      : ListItemsOfferWidget(i: index);
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
