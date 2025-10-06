import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/core/services/servicer.dart';
import 'package:ecommerce/data/datasource/remote/itemsview/review_itme_data.dart';
import 'package:ecommerce/data/model/itemsmodel.dart';
import 'package:ecommerce/data/model/review_item_model.dart';

class ReviewItemControllerImp extends GetxController {
  ItemsModel? itemsModel;
  late StatusRequst statusRequst;
  ReviewItmeData reviewItmeData = ReviewItmeData(Get.find());
  List<ReviewItemModel> reviewItem = [];
  MyService myService = Get.find();
  late String myId = myService.sharedPreferences.getString("userid")!;
  late String myUserName = myService.sharedPreferences.getString("username")!;
  late String myImage = myService.sharedPreferences.getString("myimage")!;

  getReviews() async {
    statusRequst = StatusRequst.loading;
    reviewItem.clear();
    var response = await reviewItmeData.getData(itemsModel!.itemsId.toString());
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        List data = response['data'];
        reviewItem.addAll(data.map((e) => ReviewItemModel.fromJson(e)));
      } else {
        statusRequst = StatusRequst.noData;
      }
    }
    update();
  }

  goToSendMessage({
    required String imageOtherUser,
    required String otherID,
    required String otherUserName,
    required String uid1,
    required String uid2,
  }) {
    Get.toNamed(
      AppRoutes.currentmessageing,
      arguments: {
        "imageOtherUser": imageOtherUser,
        "otherID": otherID,
        "otherUserName": otherUserName,
        "chatID": generateChatID(uid1, uid2),
      },
    );
  }

  // Future<bool> checkChatExists(String uid1, String uid2) async {
  //   String chatID = generateChatID(uid1, uid2);
  //   final result =
  //       await FirebaseFirestore.instance.collection('chat').doc(chatID).get();
  //   return result.exists;

  //   // return false;
  // }

  // Future<void> creatNewChat({
  //   required String uid1,
  //   required String uid2,
  //   required String username1,
  //   required String username2,
  //   required String nameImage1,
  //   required String nameImage2,
  // }) async {
  //   String chatID = generateChatID(uid1, uid2);
  //   final docRef = FirebaseFirestore.instance.collection("chat").doc(chatID);
  //   List<String> uids = [uid1, uid2];
  //   ChatModel chat = ChatModel(
  //     username1: username1,
  //     username2: username2,
  //     nameimage1: nameImage1,
  //     nameimage2: nameImage2,
  //     uids: uids,
  //   );
  //   await docRef.set(chat.toJson());
  // }

  String generateChatID(String uid1, String uid2) {
    List uids = [uid1, uid2];
    uids.sort();
    String chatID = uids.fold("", (id, uid) => "$id$uid");
    return chatID;
  }

  @override
  void onInit() {
    itemsModel = Get.arguments['itemmodel'];
    getReviews();
    super.onInit();
  }
}
