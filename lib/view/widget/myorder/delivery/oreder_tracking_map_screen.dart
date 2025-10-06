import 'package:ecommerce/controller/myorder/delivery/order_tracking_map_controller.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OrederTrackingMapScreen extends StatelessWidget {
  const OrederTrackingMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderTrackingMapController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Tracking Your Order"),
        centerTitle: true,
        backgroundColor: AppColor.backgroundcolorcontainer,
      ),
      body: GetBuilder<OrderTrackingMapController>(
        builder: (controller) {
          return Container(
            color: Colors.white,
            child: FlutterMap(
              mapController: controller.mapController,
              options: MapOptions(
                onPositionChanged: (camera, hasGesture) {
                  controller.getCurrentZoom(camera.zoom);
                },
                initialCenter: LatLng(
                  controller.lat,
                  controller.long,
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
                // const GetMyLocationButtonWidget(),
                // AddMyLocationButtonWidget(
                //   addressName: _addressName,
                //   fullAddress: _fullAddress,
                //   addressNameController: _addressNameController,
                //   fullAddressController: _fullAddressController,
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
