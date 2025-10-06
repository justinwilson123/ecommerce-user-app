// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/fcm_notification_fun.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/homepage/homepagedata.dart';
import 'package:ecommerce/data/datasource/remote/search/search_data.dart';
import 'package:ecommerce/data/model/cashback_model.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';

abstract class HomePageController extends GetxController {
  getData();
  goToItems(List listcategories, int itemscount, int itemcategoriesid);
  goToNotification();
  goToItemDetail(ItemsModel itemmodel);
  goToMessaging();
}

class HomepagecontrollerImp extends HomePageController {
  MyService myService = Get.find();
  late StatusRequst statusRequst;
  HomePageData homePageData = HomePageData(Get.find());
  SearchData searchData = SearchData(Get.find());
  // List<ItemsModel> itemseSearh = [];
  List<CashbackModel> cashback = [];
  List datacategories = [];
  List<ItemsModel> topofferitems = [];
  List<ItemsModel> newItems = [];
  List<ItemsModel> topRatingItems = [];
  List<ItemsModel> topSell = [];
  String? lang;
  bool onoffsearsh = false;
  String cashbackTitle = '';
  String cashbackbody = '';
  RxDouble height = 0.0.obs;
  RxDouble width = 0.0.obs;
  RxDouble heightCont = 0.0.obs;
  RxDouble widthCont = 0.0.obs;
  RxDouble heightContCtack = 0.0.obs;
  RxDouble widthContContStack = 0.0.obs;

  @override
  Future<void> getData() async {
    statusRequst = StatusRequst.loading;
    update();
    cashback.clear();
    datacategories.clear();
    topofferitems.clear();
    newItems.clear();
    topRatingItems.clear();
    topSell.clear();
    height.value = 0.0;
    width.value = 0.0;
    heightCont.value = 0.0;
    widthCont.value = 0.0;
    heightContCtack.value = 0.0;
    widthContContStack.value = 0.0;
    print("+++++++++================hoempage");
    var response = await homePageData.getData();
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        List dataCashback = response['cashback'];
        cashback.addAll(dataCashback.map((e) => CashbackModel.fromJson(e)));
        datacategories.addAll(response['categories']);

        List dataTopOffer = response['topOfferItems'];

        topofferitems.addAll(dataTopOffer.map((e) => ItemsModel.fromJson(e)));

        List dataNewItems = response['newitems'];
        newItems.addAll(dataNewItems.map((e) => ItemsModel.fromJson(e)));
        // Future.delayed()
        List dataTopRating = response['toprating'];
        topRatingItems.addAll(dataTopRating.map((e) => ItemsModel.fromJson(e)));
        List dataTopSell = response['topsell'];
        topSell.addAll(dataTopSell.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
    update();
    await Future.delayed(const Duration(milliseconds: 1000));
    animatedContainerCategories();
  }

  @override
  void onInit() {
    lang = myService.sharedPreferences.getString("lang");
    getData();
    fcmConfig();
    super.onInit();
  }

  animatedContainerCategories() {
    height.value = 100.0;
    width.value = 100.0;
    heightCont.value = 200.0;
    widthCont.value = 200;
    heightContCtack.value = 150;
    widthContContStack.value = 150;
  }

  // animaterdHeightCon() {}

  @override
  goToItems(listcategories, itemscount, itemcategoriesid) {
    // print("=======================$itemscount");
    Get.toNamed(
      AppRoutes.items,
      arguments: {
        "categories": listcategories,
        "itemindex": itemscount,
        "itemcategoriesid": itemcategoriesid,
      },
    );
  }

  @override
  goToMessaging() {
    Get.toNamed(AppRoutes.mainMessaging);
  }

  @override
  goToNotification() {
    Get.toNamed(AppRoutes.notifScreen);
  }

  @override
  goToItemDetail(ItemsModel itemmodel) {
    Get.toNamed(AppRoutes.itemsdetail, arguments: {"itemmodel": itemmodel});
  }
}
