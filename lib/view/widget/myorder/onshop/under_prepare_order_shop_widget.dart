import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ecommerce/controller/myorder/shop/under_prepare_order_shop_controller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';

class UnderPrepareOrderShopWidget
    extends GetView<UnderPrepareOrderShopControllerImp> {
  const UnderPrepareOrderShopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UnderPrepareOrderShopControllerImp());
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppColor.backgroundappcolor,
      child: RefreshIndicator(
        onRefresh: () async {
          controller.getOrder();
        },
        child: ListView(
          children: [
            GetBuilder<UnderPrepareOrderShopControllerImp>(
              builder: (controllerIm) => ViewHandLingData(
                statusRequst: controllerIm.statusRequst,
                widget: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controllerIm.myOrders.length,
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
                                Text("${controllerIm.myOrders[index].orderId}"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("130".tr),
                                Text(
                                  "${controllerIm.myOrders[index].orderStatus}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("131".tr),
                                Text(
                                  "${controllerIm.myOrders[index].orderPrice}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("132".tr),
                                Text(
                                  "${controllerIm.myOrders[index].orderTypeDelivery}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("133".tr),
                                Text(
                                  "${controllerIm.myOrders[index].orderPricedelivery}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("125".tr),
                                Text(
                                  "${controllerIm.myOrders[index].orderCoupon}",
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("134".tr),
                                Text(
                                  Jiffy.parse(
                                    '${controllerIm.myOrders[index].orderDatetime}',
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
                                    "${"148".tr}: ${controllerIm.myOrders[index].orderTotalePrice}",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: MaterialButton(
                                    onPressed: () {
                                      controllerIm.goToOrderDetail(
                                        controllerIm.myOrders[index],
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
