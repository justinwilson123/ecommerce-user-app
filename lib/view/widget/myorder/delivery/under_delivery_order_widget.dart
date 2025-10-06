import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ecommerce/controller/myorder/delivery/orders_under_delivery_controller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';

class UnderDeliveryOrderWidget extends GetView<OrdersUnderDeliveryCotollerImp> {
  const UnderDeliveryOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersUnderDeliveryCotollerImp());
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppColor.backgroundappcolor,
      child: RefreshIndicator(
        onRefresh: () async {
          controller.getOrdersUnderDelivery();
        },
        child: ListView(
          children: [
            GetBuilder<OrdersUnderDeliveryCotollerImp>(
              builder: (controllerord) => ViewHandLingData(
                statusRequst: controllerord.statusRequst,
                widget: Container(
                  padding: const EdgeInsets.all(10),
                  color: AppColor.backgroundappcolor,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controllerord.myorderunderdelivery.length,
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
                                Text(
                                  "${controllerord.myorderunderdelivery[index].orderId}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("130".tr),
                                Text(
                                  "${controllerord.myorderunderdelivery[index].orderStatus}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("131".tr),
                                Text(
                                  "${controllerord.myorderunderdelivery[index].orderPrice}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("132".tr),
                                Text(
                                  "${controllerord.myorderunderdelivery[index].orderTypeDelivery}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("133".tr),
                                Text(
                                  "${controllerord.myorderunderdelivery[index].orderPricedelivery}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("134".tr),
                                Text(
                                  Jiffy.parse(
                                    '${controllerord.myorderunderdelivery[index].orderDatetime}',
                                  ).fromNow(),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    controllerord.goToOrderDetail(
                                      controllerord.myorderunderdelivery[index],
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
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    controllerord.goToTrackingOrder(
                                      controllerord
                                          .myorderunderdelivery[index]
                                          .lat!,
                                      controllerord
                                          .myorderunderdelivery[index]
                                          .long!,
                                      controllerord
                                          .myorderunderdelivery[index]
                                          .deliveryId!,
                                      controllerord
                                          .myorderunderdelivery[index]
                                          .nameDelivery!,
                                      controllerord
                                          .myorderunderdelivery[index]
                                          .phoneDelivery!,
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
                                      "136".tr,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
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
          ],
        ),
      ),
    );
  }
}
