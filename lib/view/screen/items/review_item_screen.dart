import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/item/review_item_controller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class ReviewItemScreen extends GetView<ReviewItemControllerImp> {
  const ReviewItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReviewItemControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("100".tr, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: AppColor.praimarycolor,
      ),
      body: Container(
        color: AppColor.backgroundappcolor,
        padding: const EdgeInsets.all(10),
        child: RefreshIndicator(
          onRefresh: () async {
            controller.getReviews();
          },
          child: ListView(
            children: [
              Hero(
                tag: "${controller.itemsModel!.itemsId}",
                child: CachedNetworkImage(
                  height: Get.width / 1.2,
                  imageUrl:
                      "${Applink.linkImageItem}${controller.itemsModel!.itemsImage}",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20),
              GetBuilder<ReviewItemControllerImp>(
                builder: (controller) => ViewHandLingData(
                  statusRequst: controller.statusRequst,
                  widget: ListView.builder(
                    itemCount: controller.reviewItem.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "101".tr,
                                      style: const TextStyle(
                                        color: AppColor.praimarycolor,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "102".tr,
                                      style: const TextStyle(
                                        color: AppColor.praimarycolor,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "103".tr,
                                      style: const TextStyle(
                                        color: AppColor.praimarycolor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Text(
                                      "${controller.reviewItem[index].username}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "${controller.reviewItem[index].rating}/5",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      "${controller.reviewItem[index].comment}",
                                      textAlign: TextAlign.center,
                                    ),
                                    if (controller.myId !=
                                        "${controller.reviewItem[index].userid}")
                                      IconButton(
                                        onPressed: () {
                                          controller.goToSendMessage(
                                            imageOtherUser: controller
                                                .reviewItem[index]
                                                .imageUser!,
                                            otherID: controller
                                                .reviewItem[index]
                                                .userid
                                                .toString(),
                                            otherUserName: controller
                                                .reviewItem[index]
                                                .username!,
                                            uid1: controller
                                                .reviewItem[index]
                                                .userid
                                                .toString(),
                                            uid2: controller.myId,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.telegram,
                                          size: 40,
                                          color: Colors.orange.shade400,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
