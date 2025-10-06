import 'dart:async';

import 'package:ecommerce/data/datasource/remote/order/delivery/tracking_order_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/class/statusrequst.dart';
import '../../../core/functions/handlingdata.dart';

class OrderTrackingMapController extends GetxController {
  late double lat;
  late double long;
  late int deliveryId;
  late String deliveryName;
  late String deliveryPhone;
  double latDelivery = 0.0;
  double longDelivery = 0.0;
  StreamSubscription? trackingStream;
  TrackingOrderData trackingOrderData = TrackingOrderData();
  StatusRequst statusRequst = StatusRequst.nothing;
  MapController mapController = MapController();
  List<Marker> markers = [];
  double currentZoom = 10.0;

  void getCurrentZoom(double zoom) {
    currentZoom = zoom;
    update();
  }

  void myLocation() {
    final marker = Marker(point: LatLng(lat, long), child: Icon(Icons.house));
    markers.add(marker);
    update();
  }

  getLiveLocation() async {
    statusRequst = StatusRequst.loading;
    var response = await trackingOrderData.getTrackingOrder(
      deliveryId: deliveryId.toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response is Stream<Map>) {
        trackingStream = response.listen((data) {
          latDelivery = data['lat'];
          longDelivery = data['long'];
          if (markers.length < 2) {
            final marker = Marker(
              point: LatLng(latDelivery, longDelivery),
              child: Icon(Icons.delivery_dining),
            );
            markers.add(marker);
          } else {
            markers[1] = Marker(
              point: LatLng(latDelivery, longDelivery),
              child: Icon(Icons.delivery_dining),
            );
          }
          mapController.move(LatLng(latDelivery, longDelivery), currentZoom);
          update();
        });
      }
    }
  }

  @override
  void onInit() {
    lat = Get.arguments["Lat"];
    long = Get.arguments["Long"];
    deliveryId = Get.arguments["deliveryId"];
    deliveryName = Get.arguments["deliveyName"];
    deliveryPhone = Get.arguments["deliveryPhone"];
    myLocation();
    getLiveLocation();
    super.onInit();
  }

  @override
  void onClose() {
    mapController.dispose();
    if (trackingStream != null) {
      trackingStream!.cancel();
    }
    super.onClose();
  }
}
