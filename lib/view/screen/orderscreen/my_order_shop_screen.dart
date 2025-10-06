import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/color.dart';
// import 'package:ecommerce/view/widget/myorder/onshop/list_tabs_onshop.dart';
import 'package:ecommerce/view/widget/myorder/onshop/order_prepare_shop_widget.dart';
import 'package:ecommerce/view/widget/myorder/onshop/pending_approval_order_shop_widget.dart';
import 'package:ecommerce/view/widget/myorder/onshop/under_prepare_order_shop_widget.dart';

class MyOrderShopScreen extends StatelessWidget {
  const MyOrderShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("96".tr, style: const TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: AppColor.praimarycolor,
          bottom: TabBar(
            indicatorColor: AppColor.backgroundcolorcontainer,
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
                  "151".tr,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PendingApprovalOrderShopWidget(),
            UnderPrepareOrderShopWidget(),
            OrderPrepareShopWidget(),
          ],
        ),
      ),
    );
  }
}
