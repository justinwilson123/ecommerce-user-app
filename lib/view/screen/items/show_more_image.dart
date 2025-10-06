import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/item/show_more_imag_controller.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class ShowMoreImage extends StatelessWidget {
  const ShowMoreImage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ShowMoreImagController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          // padding: const EdgeInsets.all(10),
          child: GetBuilder<ShowMoreImagController>(
            builder: (controller) => PageView.builder(
              itemCount: controller.imagesName.length,
              controller: controller.pageController,
              itemBuilder: (context, i) {
                return CachedNetworkImage(
                  imageUrl:
                      "${Applink.linkMultiImageItem}${controller.imagesName[i]["name_image"]}",
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
