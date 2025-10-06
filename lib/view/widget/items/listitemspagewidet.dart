import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/favorite/favorite_controller.dart';
import 'package:ecommerce/controller/item/itemcontroller.dart';
import 'package:ecommerce/core/class/view_status_requset.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/linkipa.dart';
import 'package:ecommerce/core/functions/translate_from_sql.dart';

class ListItemsPageWidget extends StatelessWidget {
  const ListItemsPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ItemControllerImp controller = Get.put(ItemControllerImp());
    FavoriteController controllerfav = Get.put(FavoriteController());
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: context.isLandscape ? Get.height - 140 : Get.height - 140,
      child: Obx(() {
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if ((controller.data.length >= 10) &&
                !controller.isLoading.value &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              controller.getItems();
            }
            return true;
          },
          child: RefreshIndicator(
            onRefresh: () async {
              controller.data.clear();
              controller.page(1);
              controller.getItems();
            },
            child: MasonryGridView.count(
              crossAxisCount: controller.data.isEmpty
                  ? 1
                  : context.isLandscape
                  ? 4
                  : 2,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
              itemCount: controller.data.isEmpty
                  ? 1
                  : controller.data.length +
                        (controller.isLoading.value ? 1 : 0),
              itemBuilder: (context, i) {
                if (controller.data.isNotEmpty && !controller.isLoading.value) {
                  controllerfav.favoriteitems[controller.data[i].itemsId] =
                      controller.data[i].favoriteactiv;
                }
                if (i >= controller.data.length && controller.data.isNotEmpty) {
                  return ViewStatusRequset(
                    statusRequst: controller.statusRequst.value,
                    size: 40,
                    height: null,
                  );
                }
                return controller.data.isEmpty
                    ? GetBuilder<ItemControllerImp>(
                        builder: (controller) => ViewStatusRequset(
                          statusRequst: controller.statusRequst.value,
                          size: 250,
                          height: Get.height / 1.235,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          controller.goToItemDetail(controller.data[i]);
                        },
                        child: Stack(
                          children: [
                            Card(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  const SizedBox(height: 10),
                                  Hero(
                                    tag: "${controller.data[i].itemsId}",
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "${Applink.linkImageItem}${controller.data[i].itemsImage}",
                                    ),
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    translateFromSpl(
                                      controller.data[i].itemsNameAr,
                                      controller.data[i].itemsNameEn,
                                    ),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ...List.generate(
                                        5,
                                        (ind) => Icon(
                                          ind < controller.data[i].rating!
                                              ? Icons.star
                                              : Icons.star_border_outlined,
                                          size: 15,
                                          color:
                                              ind < controller.data[i].rating!
                                              ? AppColor.praimarycolor
                                              : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    "${controller.data[i].itemsPrice} \$",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.praimarycolor,
                                      overflow: TextOverflow.fade,
                                      decoration:
                                          controller.data[i].itemsDiscount != 0
                                          ? TextDecoration.lineThrough
                                          : null,
                                    ),
                                  ),
                                  controller.data[i].itemsDiscount != 0
                                      ? Text(
                                          "${controller.data[i].itemsPriceDiscount} \$",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.praimarycolor,
                                            overflow: TextOverflow.fade,
                                          ),
                                        )
                                      : const SizedBox(height: 1),
                                  GetBuilder<FavoriteController>(
                                    builder: (controllerfa) => IconButton(
                                      onPressed: () {
                                        if (controllerfa
                                                .favoriteitems[controller
                                                .data[i]
                                                .itemsId] ==
                                            0) {
                                          controllerfa.setFavorate(
                                            controller.data[i].itemsId,
                                            1,
                                          );
                                          controllerfa.addfavoties(
                                            controller.data[i].itemsId,
                                          );
                                        } else {
                                          controllerfa.setFavorate(
                                            controller.data[i].itemsId,
                                            0,
                                          );
                                          controllerfa.removefavoties(
                                            controller.data[i].itemsId,
                                          );
                                        }
                                      },
                                      icon: Icon(
                                        controllerfa.favoriteitems[controller
                                                    .data[i]
                                                    .itemsId] ==
                                                0
                                            ? Icons.favorite_border_outlined
                                            : Icons.favorite,
                                        color:
                                            controllerfa
                                                    .favoriteitems[controller
                                                    .data[i]
                                                    .itemsId] ==
                                                0
                                            ? Colors.black
                                            : AppColor.praimarycolor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            if (controller.data[i].itemsDiscount != 0)
                              Image.asset(
                                AppImageAsset.offerimage,
                                height: 40,
                                width: 40,
                              ),
                          ],
                        ),
                      );
              },
            ),
          ),
        );
      }),
    );
  }
}

// class Items extends GetView<ItemControllerImp> {
//   final ItemsModel itemsModel;
//   const Items({super.key, required this.itemsModel});

//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }
