import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/setting_controller/location/my_location_controller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/setting/location/list_mylocation_widget.dart';

class MyLocationScreen extends StatelessWidget {
  const MyLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocationController controller = Get.put(MyLocationController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.praimarycolor,
        onPressed: () {
          controller.goToAddlocation();
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.praimarycolor,
        title: Text("77".tr, style: const TextStyle(color: Colors.white)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: AppColor.backgroundappcolor,
        child: GetBuilder<MyLocationController>(
          builder: (controller) => ViewHandLingData(
            statusRequst: controller.statusRequst,
            widget: const ListMylocationWidget(),
          ),
        ),
      ),
    );
  }
}
