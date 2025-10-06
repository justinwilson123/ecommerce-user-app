import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/search/search_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';

class SearchContoller extends GetxController {
  late TextEditingController search;
  // GlobalKey<FormState> key = GlobalKey<FormState>();
  SearchData searchData = SearchData(Get.find());
  bool onoffsearsh = false;
  List<ItemsModel> itemseSearh = [];
  StatusRequst? statusRequst;

  refrish() {
    itemseSearh.clear();
    search.clear();
    onoffsearsh = false;
    update();
  }

  onoffsearchfinction(val) {
    if (val == "") {
      onoffsearsh = false;
      statusRequst = StatusRequst.nothing;
    }
    update();
  }

  searchitem(String val) async {
    if (search.text == "") {
      Get.snackbar("alert", "please enter name for search it");
    } else {
      onoffsearsh = true;
      statusRequst = StatusRequst.loading;

      var response = await searchData.searchtData(val);
      statusRequst = handlingData(response);
      itemseSearh.clear();
      update();
      if (StatusRequst.success == statusRequst) {
        if (response['status'] == "success") {
          List resposedata = response["data"];
          itemseSearh.addAll(resposedata.map((e) => ItemsModel.fromJson(e)));
        } else {
          statusRequst = StatusRequst.noData;
        }
      }
    }
    update();
  }

  gotoitemsearchtodetils(ItemsModel itemsmodle) {
    Get.toNamed(AppRoutes.itemsdetail, arguments: {"itemmodel": itemsmodle});
  }

  @override
  void onInit() {
    // refresh();
    search = TextEditingController();
    super.onInit();
  }
}
