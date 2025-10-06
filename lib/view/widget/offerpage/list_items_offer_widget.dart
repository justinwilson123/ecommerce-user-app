import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/favorite/favorite_controller.dart';
import 'package:ecommerce/controller/itemsofferpage/items_offer_page_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/constant/linkipa.dart';
import 'package:ecommerce/core/functions/translate_from_sql.dart';

class ListItemsOfferWidget extends GetView<ItemsOfferPageControllerImp> {
  final int i;
  const ListItemsOfferWidget({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsOfferPageControllerImp());
    return InkWell(
      onTap: () {
        controller.goToItemDetail(controller.offeritems[i]);
      },
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Hero(
                  tag: "${controller.offeritems[i].itemsId}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "${Applink.linkImageItem}${controller.offeritems[i].itemsImage}",
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  translateFromSpl(
                    controller.offeritems[i].itemsNameAr,
                    controller.offeritems[i].itemsNameEn,
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      5,
                      (index) => Icon(
                        index < controller.offeritems[i].rating!
                            ? Icons.star
                            : Icons.star_border_outlined,
                        size: 15,
                        color: index < controller.offeritems[i].rating!
                            ? AppColor.praimarycolor
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  "${controller.offeritems[i].itemsPrice} \$",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.praimarycolor,
                    overflow: TextOverflow.fade,
                    decoration: controller.offeritems[i].itemsDiscount != 0
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
                controller.offeritems[i].itemsDiscount != 0
                    ? Text(
                        "${controller.offeritems[i].itemsPriceDiscount} \$",
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
                      if (controllerfa.favoriteitems[controller
                              .offeritems[i]
                              .itemsId] ==
                          0) {
                        controllerfa.setFavorate(
                          controller.offeritems[i].itemsId,
                          1,
                        );
                        controllerfa.addfavoties(
                          controller.offeritems[i].itemsId,
                        );
                      } else {
                        controllerfa.setFavorate(
                          controller.offeritems[i].itemsId,
                          0,
                        );
                        controllerfa.removefavoties(
                          controller.offeritems[i].itemsId,
                        );
                      }
                    },
                    icon: Icon(
                      controllerfa.favoriteitems[controller
                                  .offeritems[i]
                                  .itemsId] ==
                              0
                          ? Icons.favorite_border_outlined
                          : Icons.favorite,
                      color:
                          controllerfa.favoriteitems[controller
                                  .offeritems[i]
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
          if (controller.offeritems[i].itemsDiscount != 0)
            Image.asset(AppImageAsset.offerimage, height: 40, width: 40),
        ],
      ),
    );
  }
}
