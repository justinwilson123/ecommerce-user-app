import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/hoempagecontroller/homepagecontroller.dart';
import 'package:ecommerce/core/constant/linkipa.dart';
import 'package:ecommerce/core/functions/translate_from_sql.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';

class HoemPageCategoriesWidget extends StatelessWidget {
  const HoemPageCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomepagecontrollerImp controller = Get.find<HomepagecontrollerImp>();
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: controller.datacategories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesmodel: Categoriesmodel.fromJson(
              controller.datacategories[index],
            ),
          );
        },
        // ),
      ),
    );
  }
}

class Categories extends GetView<HomepagecontrollerImp> {
  final Categoriesmodel categoriesmodel;
  final int? i;
  const Categories({super.key, required this.categoriesmodel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
          controller.datacategories,
          i!,
          categoriesmodel.categoriesId!,
        );
      },
      child: Column(
        children: [
          Obx(() {
            return AnimatedSize(
              duration: Duration(milliseconds: 750),
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.all(10),
                height: controller.height.value,
                width: controller.width.value,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(
                      "${Applink.linkImageCategories}${categoriesmodel.categoriesImage}",
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }),
          const SizedBox(height: 5),
          Text(
            "${translateFromSpl(categoriesmodel.categoriesNameAr, categoriesmodel.categoriesNameEn)}",
            style: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 241, 14, 14),
            ),
          ),
        ],
      ),
    );
  }
}
