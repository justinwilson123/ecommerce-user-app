import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/item/itemcontroller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/functions/translate_from_sql.dart';
import 'package:ecommerce/data/model/categoriesmodel.dart';

class ListCatrgoriesItemsWidget extends GetView<ItemControllerImp> {
  const ListCatrgoriesItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      height: 45,
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 15),

        // padding: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: AppColor.backgroundcolorcontainer,
          borderRadius: BorderRadius.circular(10),
        ),
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
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final Categoriesmodel categoriesmodel;
  final int? i;
  const Categories({super.key, required this.categoriesmodel, required this.i});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    return GetBuilder<ItemControllerImp>(
      builder: (controller) => InkWell(
        onTap: () {
          controller.changeCategories(i!, categoriesmodel.categoriesId!);
        },
        child: Container(
          // width: Get.height / 12,
          margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          // padding: const EdgeInsets.all(10),
          decoration: controller.myitemcount == i
              ? const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColor.praimarycolor, width: 2),
                  ),
                )
              : null,
          child: Text(
            translateFromSpl(
              categoriesmodel.categoriesNameAr,
              categoriesmodel.categoriesNameEn,
            ),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
