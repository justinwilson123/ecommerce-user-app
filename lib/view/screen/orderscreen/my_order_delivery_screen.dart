import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/color.dart';
// import 'package:ecommerce/view/widget/myorder/delivery/list_tabs_widget.dart';
import 'package:ecommerce/view/widget/myorder/delivery/order_delivered_widget.dart';
import 'package:ecommerce/view/widget/myorder/delivery/order_state_prepare_delivery_widget.dart';
import 'package:ecommerce/view/widget/myorder/delivery/pending_approval_order_delivery_widget.dart';
import 'package:ecommerce/view/widget/myorder/delivery/under_delivery_order_widget.dart';

class MyOrderDeliveryScreen extends StatelessWidget {
  const MyOrderDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.praimarycolor,
          title: Text(
            "97".tr,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: AppColor.backgroundcolorcontainer,
            onTap: (value) {},
            tabs: [
              Tab(
                child: Text(
                  "142".tr,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              Tab(
                child: Text(
                  "143".tr,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              Tab(
                child: Text(
                  "144".tr,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              Tab(
                child: Text(
                  "145".tr,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PendingApprovalOrderDeliveryWidget(),
            OrderStatePrepareDeliveryWidget(),
            UnderDeliveryOrderWidget(),
            OrderDeliveredWidget(),
          ],
        ),
      ),
    );
  }
}
