import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ecommerce/controller/myorder/orders_archive_controller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/myorder/rating_order_widget.dart';

class OrdersArchiveWidget extends StatelessWidget {
  const OrdersArchiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveControllerImp());
    return GetBuilder<OrdersArchiveControllerImp>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {
          controller.getOrdersArchive();
        },
        child: ViewHandLingData(
          statusRequst: controller.statusRequst,
          widget: Container(
            padding: const EdgeInsets.all(10),
            color: AppColor.backgroundappcolor,
            child: ListView.builder(
              itemCount: controller.myorderArchive.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("129".tr),
                          Text("${controller.myorderArchive[index].orderId}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("130".tr),
                          Text(
                            "${controller.myorderArchive[index].orderStatus}",
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("131".tr),
                          Text(
                            "${controller.myorderArchive[index].orderPrice}",
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("132".tr),
                          Text(
                            "${controller.myorderArchive[index].orderTypeDelivery}",
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("133".tr),
                          Text(
                            "${controller.myorderArchive[index].orderPricedelivery}",
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("134".tr),
                          Text(
                            Jiffy.parse(
                              '${controller.myorderArchive[index].orderDatetime}',
                            ).fromNow(),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          controller.myorderArchive[index].rating == 0
                              ? MaterialButton(
                                  onPressed: () {
                                    showratingdialouge(
                                      context,
                                      controller.myorderArchive[index].orderId!,
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColor.praimarycolor,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 3,
                                    ),
                                    child: Text(
                                      "137".tr,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Text("138".tr),
                          MaterialButton(
                            onPressed: () {
                              controller.goToOrderDetailandrating(
                                controller.myorderArchive[index],
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.praimarycolor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 3,
                                horizontal: 6,
                              ),
                              child: Text(
                                "135".tr,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
