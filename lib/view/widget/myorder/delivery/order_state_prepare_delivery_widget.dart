import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ecommerce/controller/myorder/delivery/order_state_prepare_controller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';

class OrderStatePrepareDeliveryWidget
    extends GetView<OrderStatePrepareControllerImp> {
  const OrderStatePrepareDeliveryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderStatePrepareControllerImp());
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppColor.backgroundappcolor,
      child: RefreshIndicator(
        onRefresh: () async {
          controller.getOrder();
        },
        child: ListView(
          children: [
            GetBuilder<OrderStatePrepareControllerImp>(
              builder: (controllerord) => ViewHandLingData(
                statusRequst: controllerord.statusRequst,
                widget: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controllerord.myOrders.length,
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
                              Text("${controllerord.myOrders[index].orderId}"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("130".tr),
                              Text(
                                "${controllerord.myOrders[index].orderStatus}",
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("131".tr),
                              Text(
                                "${controllerord.myOrders[index].orderPrice}",
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("132".tr),
                              Text(
                                "${controllerord.myOrders[index].orderTypeDelivery}",
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("133".tr),
                              Text(
                                "${controllerord.myOrders[index].orderPricedelivery}",
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("134".tr),
                              Text(
                                Jiffy.parse(
                                  '${controllerord.myOrders[index].orderDatetime}',
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
                                    controllerord.myOrders[index],
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
                              // MaterialButton(
                              //   onPressed: () {},
                              //   child: Container(
                              //     decoration: BoxDecoration(
                              //       color: AppColor.praimarycolor,
                              //       borderRadius: BorderRadius.circular(5),
                              //     ),
                              //     padding: const EdgeInsets.symmetric(
                              //       vertical: 3,
                              //       horizontal: 6,
                              //     ),
                              //     child: Text(
                              //       "136".tr,
                              //       style: const TextStyle(color: Colors.white),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
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
