import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/services/servicer.dart';

class Mymiddleware extends GetMiddleware {
  MyService myService = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myService.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.homescreen);
    }
    if (myService.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}
