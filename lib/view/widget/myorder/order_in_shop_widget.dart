import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ecommerce/controller/myorder/orders_on_shope_cotroller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';

class OrderInShopWidget extends StatelessWidget {
  const OrderInShopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersOnShopeCotrollerImp());
    return GetBuilder<OrdersOnShopeCotrollerImp>(
      builder: (controller) => RefreshIndicator(
        onRefresh: () async {
          controller.getOrdersOnShope();
        },
        child: ViewHandLingData(
          statusRequst: controller.statusRequst,
          widget: Container(
            padding: const EdgeInsets.all(10),
            color: AppColor.backgroundappcolor,
            child: ListView.builder(
              itemCount: controller.myorderOnShope.length,
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
                          Text("${controller.myorderOnShope[index].orderId}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("130".tr),
                          Text(
                            "${controller.myorderOnShope[index].orderStatus}",
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("131".tr),
                          Text(
                            "${controller.myorderOnShope[index].orderPrice}",
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("132".tr),
                          Text(
                            "${controller.myorderOnShope[index].orderTypeDelivery}",
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("133".tr),
                          Text(
                            "${controller.myorderOnShope[index].orderPricedelivery}",
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("134".tr),
                          Text(
                            Jiffy.parse(
                              '${controller.myorderOnShope[index].orderDatetime}',
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
                              controller.goToOrderDetail(
                                controller.myorderOnShope[index],
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
                          MaterialButton(
                            onPressed: () {},
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
