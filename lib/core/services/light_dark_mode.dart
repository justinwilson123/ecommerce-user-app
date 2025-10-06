import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/core/services/servicer.dart';

class ThemeDataMode {
  MyService myService = Get.find();
  final ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(
        height: 1.5,
        fontWeight: FontWeight.bold,
        color: AppColor.gray,
      ),
    ),
  );
  final ThemeData darkTheme = ThemeData.dark().copyWith(
    cardColor: Colors.black45,
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(),
    dividerColor: Colors.white54,
  );
}
