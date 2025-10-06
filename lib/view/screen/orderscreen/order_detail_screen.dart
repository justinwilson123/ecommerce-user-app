import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/myorder/order_details_cotroller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/myorder/order_detail_items_widget.dart';
import 'package:ecommerce/view/widget/myorder/order_detail_total_price_widget.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsCotrollerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.praimarycolor,
        title: Text("95".tr, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        color: AppColor.backgroundappcolor,
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrderDetailsCotrollerImp>(
          builder: (controller) => ViewHandLingData(
            statusRequst: controller.statusRequst,
            widget: ListView(
              children: const [
                OrderDetailItemsWidget(),
                SizedBox(height: 10),
                OrderDetailTotalPriceWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
