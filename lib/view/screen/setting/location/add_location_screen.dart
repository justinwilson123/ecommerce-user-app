import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:ecommerce/controller/setting_controller/location/add_location_controller.dart';
import 'package:ecommerce/core/class/viewhandlingdata.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/constant/imageasset.dart';
import 'package:ecommerce/core/functions/validatorfunction.dart';
import 'package:ecommerce/view/widget/setting/location/button_location_widget.dart';
import 'package:ecommerce/view/widget/setting/location/text_form_filed_location_widget.dart';
import 'package:latlong2/latlong.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddLocationController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.praimarycolor,
        title: Text("86".tr, style: const TextStyle(color: Colors.white)),
      ),
      body: GetBuilder<AddLocationController>(
        builder: (controller) => ViewHandLingData(
          statusRequst: controller.statusRequst,
          widget: Container(
            color: AppColor.backgroundappcolor,
            padding: const EdgeInsets.all(10),
            child: FlutterMap(
              mapController: controller.mapController,
              options: MapOptions(
                onPositionChanged: (camera, hasGesture) {
                  controller.getCurrentZoom(camera.zoom);
                },
                onTap: (tapposition, latLng) {
                  controller.getPosition(latLng.latitude, latLng.longitude);
                },
                initialCenter: LatLng(
                  34.039,
                  36.03494,
                ), // Center the map over London
                initialZoom: 10,
              ),

              children: [
                TileLayer(
                  urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
                  userAgentPackageName:
                      'com.example.ecommerce', // Add your app identifier
                  // And many more recommended properties!
                ),
                MarkerLayer(markers: controller.markers),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () {
                      controller.getPositionGeolocator();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColor.backgroundcolorcontainer,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(child: Icon(Icons.location_on)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: AppColor.backgroundappcolor,
                        showDragHandle: true,
                        context: context,
                        builder: (_) {
                          return Container(
                            height: 600,
                            color: AppColor.backgroundappcolor,
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 10,
                            ),
                            child: _detailsLocation(controller),
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColor.backgroundcolorcontainer,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(child: Icon(Icons.add)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _detailsLocation(AddLocationController controller) {
    return SizedBox(
      child: Form(
        key: controller.mykey,
        child: ListView(
          children: [
            Text("Details Location"),
            TextFormFiledLocationWidget(
              validator: (val) {
                return validtorFunction(val!, 2, 30, "name");
              },
              controller: controller.namelocation,
              hintText: "87".tr,
              icon: Icons.location_city_sharp,
            ),
            TextFormFiledLocationWidget(
              validator: (val) {
                return validtorFunction(val!, 2, 30, "name");
              },
              controller: controller.country,
              hintText: "88".tr,
              icon: Icons.location_history,
            ),
            TextFormFiledLocationWidget(
              validator: (val) {
                return validtorFunction(val!, 2, 30, "name");
              },
              controller: controller.state,
              hintText: "89".tr,
              icon: Icons.location_city,
            ),
            TextFormFiledLocationWidget(
              validator: (val) {
                return validtorFunction(val!, 2, 30, "name");
              },
              controller: controller.city,
              hintText: "90".tr,
              icon: Icons.location_city_sharp,
            ),
            TextFormFiledLocationWidget(
              validator: (val) {
                return validtorFunction(val!, 2, 200, "name");
              },
              controller: controller.street,
              hintText: "91".tr,
              icon: Icons.location_city_sharp,
            ),
            TextFormFiledLocationWidget(
              validator: (val) {
                return validtorFunction(val!, 5, 30, "name");
              },
              controller: controller.yourName,
              hintText: "92".tr,
              icon: Icons.person_2_outlined,
            ),
            TextFormFiledLocationWidget(
              validator: (val) {
                return validtorFunction(val!, 2, 1000, "phone");
              },
              controller: controller.phoneNumber,
              hintText: "09********",
              icon: Icons.phone_android,
              keyboardType: TextInputType.phone,
            ),
            TextFormFiledLocationWidget(
              validator: (val) {
                return validtorFunction(val!, 2, 1000, "name");
              },
              maxline: 3,
              controller: controller.detailslocation,
              hintText: "93".tr,
              icon: Icons.details_outlined,
            ),
            ButtonLocationWidget(
              onPressed: () {
                controller.getData();
              },
              text: "94".tr,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
