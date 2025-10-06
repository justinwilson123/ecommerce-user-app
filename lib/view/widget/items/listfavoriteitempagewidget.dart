import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/favorite/favorite_controller.dart';
import 'package:ecommerce/controller/favorite/view_favorite_controller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/linkipa.dart';
import 'package:ecommerce/core/functions/translate_from_sql.dart';

class Listfavoriteitempagewidget extends StatelessWidget {
  const Listfavoriteitempagewidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewFavoriteControllerImp());
    return GetBuilder<ViewFavoriteControllerImp>(
      builder: (controller) => ViewHandLingData(
        statusRequst: controller.statusRequst,
        widget: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          itemCount: controller.data.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Items(i: index);
          },
        ),
      ),
    );
  }
}

class Items extends GetView<ViewFavoriteControllerImp> {
  final int i;
  const Items({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerfa = Get.put(FavoriteController());
    return InkWell(
      onTap: () {
        controller.goToItemDetail(controller.myItemsModel[i]);
      },
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Hero(
              tag: "${controller.myItemsModel[i].itemsId!}",
              child: CachedNetworkImage(
                imageUrl:
                    "${Applink.linkImageItem}${controller.data[i].itemsImage}",
              ),
            ),
            Text(
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
                  (index) => Icon(
                    index < controller.data[i].rating!
                        ? Icons.star
                        : Icons.star_border_outlined,
                    size: 15,
                    color: index < controller.data[i].rating!
                        ? AppColor.praimarycolor
                        : Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              "${controller.myItemsModel[i].itemsPriceDiscount} \$",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.praimarycolor,
                overflow: TextOverflow.fade,
              ),
            ),
            IconButton(
              onPressed: () {
                controller.deletfavorite(controller.data[i].favoriteId);
                controllerfa.setFavorate(controller.data[i].itemsId, 0);
              },
              icon: const Icon(Icons.delete_forever, color: Colors.grey),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
