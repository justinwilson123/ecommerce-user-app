import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
// import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/testdata.dart';

class Testcontroller extends GetxController {
  TestData testData = TestData(Get.find());
  Map data = {};
  late StatusRequst statusRequst;

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();
      if (googleUser == null) {
        return;
      }
      print("${googleUser.displayName!}");
      print("${googleUser.email}");
      print("${googleUser.id}");
      // final GoogleSignInAuthentication? googleAuth =
      //     await googleUser?.authentication;

      //   statusRequst = StatusRequst.loading;

      //   var response = await testData.getData(
      //       googleUser.displayName!, googleUser.email, googleUser.id);
      //   statusRequst = handlingData(response);
      //   if (StatusRequst.success == statusRequst) {
      //     if (response['status'] == "success") {
      //       data.addAll(response['data']);
      //       print("${data}");
      //     } else {
      //       statusRequst = StatusRequst.noData;
      //     }
      //   }
      //   update();
    } catch (e) {
      print("==============================================$e");
    }
  }
}
