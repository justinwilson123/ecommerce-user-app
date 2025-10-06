import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/location/add_location_data.dart';
import 'package:latlong2/latlong.dart';

abstract class AddlocController extends GetxController {
  Future<void> getData();
  void getPosition(double lat, double long);
  void getCurrentZoom(double zoom);
}

class AddLocationController extends AddlocController {
  late TextEditingController country;
  late TextEditingController state;
  late TextEditingController city;
  late TextEditingController street;
  late TextEditingController namelocation;
  late TextEditingController detailslocation;
  late TextEditingController phoneNumber;
  late TextEditingController yourName;
  double longitude = 0.0;
  double latitude = 0.0;
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  List<Marker> markers = [];
  AddLocationData addLocationData = AddLocationData(Get.find());
  MapController mapController = MapController();
  StatusRequst statusRequst = StatusRequst.nothing;
  MyService myService = Get.find();
  double currentZoom = 0.0;

  @override
  getPosition(double lat, double long) {
    final marker = Marker(
      point: LatLng(lat, long),
      child: Icon(Icons.location_on),
    );
    latitude = lat;
    longitude = long;
    markers.clear();
    markers.add(marker);
    mapController.move(LatLng(latitude, longitude), currentZoom);
    update();
  }

  @override
  void getCurrentZoom(double zoom) {
    currentZoom = zoom;
    update();
  }

  Future<void> getPositionGeolocator() async {
    final serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (serviceEnable) {
      Position position = await Geolocator.getCurrentPosition();
      latitude = position.latitude;
      longitude = position.longitude;
      final marker = Marker(
        point: LatLng(latitude, longitude),
        child: Icon(Icons.location_on),
      );
      markers.clear();
      markers.add(marker);
      mapController.move(LatLng(latitude, longitude), currentZoom);
      update();
    } else {
      Get.snackbar("alert", "pleas turn on location service on your phone");
    }
  }

  @override
  getData() async {
    if (markers.isNotEmpty) {
      if (mykey.currentState!.validate()) {
        statusRequst = StatusRequst.loading;
        update();
        var response = await addLocationData.addData(
          country.text,
          state.text,
          city.text,
          street.text,
          longitude.toString(),
          latitude.toString(),
          myService.sharedPreferences.getString("userid").toString(),
          namelocation.text,
          detailslocation.text,
          phoneNumber.text,
          yourName.text,
        );
        statusRequst = handlingData(response);
        if (StatusRequst.success == statusRequst) {
          if (response['status'] == "success") {
            Get.snackbar("160".tr, "167".tr);
            Get.offNamed(AppRoutes.mylocation);
          } else {
            statusRequst = StatusRequst.noData;
          }
        }
        update();
      }
    } else {
      Get.snackbar("alert", "please select your location on Map");
    }
  }

  @override
  void onInit() {
    // getPosition();
    country = TextEditingController();
    state = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    namelocation = TextEditingController();
    detailslocation = TextEditingController();
    phoneNumber = TextEditingController();
    yourName = TextEditingController();
    super.onInit();
  }
}
