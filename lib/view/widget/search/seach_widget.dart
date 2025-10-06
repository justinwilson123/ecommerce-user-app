import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/search/search_contoller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/linkipa.dart';
import 'package:ecommerce/core/functions/translate_from_sql.dart';

class SearchWidget extends GetView<SearchContoller> {
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final double? height;
  const SearchWidget({
    super.key,
    required this.shrinkWrap,
    this.physics,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(SearchContoller());
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: height,
        child: ListView.builder(
          shrinkWrap: shrinkWrap,
          physics: physics,
          itemCount: controller.itemseSearh.length,
          itemBuilder: (context, i) {
            return SizedBox(
              height: 100,
              // margin: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  controller.gotoitemsearchtodetils(controller.itemseSearh[i]);
                },
                child: Card(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Hero(
                          tag: "${controller.itemseSearh[i].itemsId!}",
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                "${Applink.linkImageItem}${controller.itemseSearh[i].itemsImage}",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${translateFromSpl(controller.itemseSearh[i].itemsNameAr, controller.itemseSearh[i].itemsNameEn)}",
                            ),
                            Text(
                              "${controller.itemseSearh[i].itemsPriceDiscount}\$",
                              style: const TextStyle(
                                color: AppColor.praimarycolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
