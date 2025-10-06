import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/constant/color.dart';
import 'package:ecommerce/view/widget/items/listfavoriteitempagewidget.dart';

class FavoriteItemsScreen extends StatelessWidget {
  const FavoriteItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("104".tr),
        backgroundColor: AppColor.praimarycolor,
        centerTitle: true,
      ),
      body: Container(
        color: AppColor.backgroundappcolor,
        padding: const EdgeInsets.all(15),
        child: ListView(children: const [Listfavoriteitempagewidget()]),
      ),
    );
  }
}
