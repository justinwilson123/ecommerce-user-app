import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/cart/cart_data.dart';
import 'package:ecommerce/data/datasource/remote/itemsview/items_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';

abstract class ItemDetailController extends GetxController {
  inti();
  chosecolor(int i);
  addcount();
  removecount(itemid);
  countcarts(itemid);
  goToReviewItem();
  showMoreImage();
  showVideo();
  goToShowMoreItems();
  goToShowVideoItem();
}

class ItemDetailControllerImp extends ItemDetailController {
  StatusRequst statusRequst = StatusRequst.nothing;
  CartData cartData = CartData(Get.find());
  ItemsData itemsData = ItemsData(Get.find());
  MyService myService = Get.find();
  // CartControllerImp controllerImp = Get.put(CartControllerImp());
  int count = 0;

  ItemsModel? itemmodel;

  int? index;
  String? videoNmae;
  List imagesName = [];

  List colorchose = [
    {"name": "red", "active": 1},
    {"name": "green", "active": 1},
    {"name": "black", "active": 1},
  ];

  @override
  inti() {
    itemmodel = Get.arguments["itemmodel"];
  }

  @override
  void onInit() {
    inti();
    countcarts(itemmodel!.itemsId);
    count;
    showMoreImage();
    showVideo();
    super.onInit();
  }

  @override
  chosecolor(int i) {
    index = i;
    update();
  }

  @override
  addcount() async {
    count++;
    update();

    var response = await cartData.addfcart(
      myService.sharedPreferences.getString("userid").toString(),
      itemmodel!.itemsId.toString(),
      (itemmodel!.itemsPrice! -
              (itemmodel!.itemsPrice! * itemmodel!.itemsDiscount! / 100))
          .toString(),
      itemmodel!.itemsNameEn!,
      itemmodel!.itemsNameAr!,
      itemmodel!.itemsImage!,
      // itemid.toString(),
      // itemPrice.toString(),
      // itemNameEn.toString(),
      // itemNameAr.toString(),
      // itemImageName.toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        Get.snackbar(
          "152".tr,
          "165".tr,
          duration: const Duration(milliseconds: 800),
        );
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
  }

  @override
  removecount(itemid) async {
    if (count > 0) {
      count--;
      update();
      var response = await cartData.deletecart(
        myService.sharedPreferences.getString("userid"),
        itemid.toString(),
      );
      statusRequst = handlingData(response);
      if (StatusRequst.success == statusRequst) {
        if (response['status'] == "success") {
          // print(object)
          Get.snackbar(
            "152".tr,
            "166".tr,
            duration: const Duration(milliseconds: 800),
          );
        } else {
          statusRequst = StatusRequst.noData;
        }
      }
    }
  }

  @override
  countcarts(itemid) async {
    var response = await cartData.countcart(
      myService.sharedPreferences.getString("userid"),
      itemid.toString(),
    );
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      count = response["data"];
    }
    update();
  }

  @override
  goToReviewItem() {
    Get.toNamed(AppRoutes.reviewItem, arguments: {"itemmodel": itemmodel});
  }

  @override
  showMoreImage() async {
    var response = await itemsData.getDataimages(itemmodel!.itemsId.toString());
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response["status"] == "success") {
        imagesName.addAll(response["data"]);
      }
    }
    update();
  }

  @override
  showVideo() async {
    var response = await itemsData.getDataVideo(itemmodel!.itemsId.toString());
    statusRequst = handlingData(response);
    if (statusRequst == StatusRequst.success) {
      if (response["status"] == "success") {
        print("${response["data"]}");
        videoNmae = response["data"];
        print("$videoNmae");
      }
    }
    update();
  }

  @override
  goToShowMoreItems() {
    Get.toNamed(AppRoutes.showMoreImage, arguments: {"imagesName": imagesName});
  }

  @override
  goToShowVideoItem() {
    Get.toNamed(AppRoutes.showVideo, arguments: {"videoName": videoNmae});
  }
}
