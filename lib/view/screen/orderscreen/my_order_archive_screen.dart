import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/myorder/orders_archive_widget.dart';

class MyOrderArchiveScreen extends StatelessWidget {
  const MyOrderArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("98".tr),
        centerTitle: true,
        backgroundColor: AppColor.praimarycolor,
      ),
      body: const OrdersArchiveWidget(),
    );
  }
}
