import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ecommerce/controller/myorder/shop/pending_approval_shop_controller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';

class PendingApprovalOrderShopWidget
    extends GetView<PendingApprovalShopControllerImp> {
  const PendingApprovalOrderShopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingApprovalShopControllerImp());
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppColor.backgroundappcolor,
      child: RefreshIndicator(
        onRefresh: () async {
          controller.getOrderPending();
        },
        child: ListView(
          children: [
            GetBuilder<PendingApprovalShopControllerImp>(
              builder: (controller) => ViewHandLingData(
                statusRequst: controller.statusRequst,
                widget: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.myorderpending.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("129".tr),
                                Text(
                                  "${controller.myorderpending[index].orderId}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("130".tr),
                                Text(
                                  "${controller.myorderpending[index].orderStatus}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("131".tr),
                                Text(
                                  "${controller.myorderpending[index].orderPrice}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("132".tr),
                                Text(
                                  "${controller.myorderpending[index].orderTypeDelivery}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("133".tr),
                                Text(
                                  "${controller.myorderpending[index].orderPricedelivery}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("125".tr),
                                Text(
                                  "${controller.myorderpending[index].orderCoupon}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("134".tr),
                                Text(
                                  Jiffy.parse(
                                    '${controller.myorderpending[index].orderDatetime}',
                                  ).fromNow(),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "${"148".tr}: ${controller.myorderpending[index].orderTotalePrice}",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: MaterialButton(
                                    onPressed: () {
                                      controller.goToOrderDetail(
                                        controller.myorderpending[index],
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.praimarycolor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6,
                                        horizontal: 6,
                                      ),
                                      child: Text(
                                        "135".tr,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: IconButton(
                                    onPressed: () {
                                      Get.defaultDialog(
                                        cancelTextColor: AppColor.praimarycolor,
                                        buttonColor: AppColor.praimarycolor,
                                        titleStyle: const TextStyle(
                                          color: AppColor.praimarycolor,
                                        ),
                                        middleTextStyle: const TextStyle(
                                          color: AppColor.praimarycolor,
                                        ),
                                        title: "50".tr,
                                        middleText: "149".tr,
                                        textCancel: "62".tr,
                                        textConfirm: "150".tr,
                                        onConfirm: () {
                                          controller.deletOrder(
                                            controller
                                                .myorderpending[index]
                                                .orderId!,
                                          );
                                          Get.back();
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
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
    );
  }
}
