import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/login/otplogindata.dart';

abstract class OtpLoginController extends GetxController {
  verifiAndGoToLogin(String code);
}

class OtpLoginControllerImp extends OtpLoginController {
  StatusRequst statusRequst = StatusRequst.nothing;
  OtpLoginData otpLoginData = OtpLoginData(Get.find());
  String? useremail;
  @override
  verifiAndGoToLogin(String code) async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await otpLoginData.postData(useremail!, code);
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        Get.snackbar("43".tr, "44".tr);
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.snackbar("45".tr, "46".tr);
      }
    }
    update();
  }

  @override
  void onInit() {
    useremail = Get.arguments["email"];
    super.onInit();
  }
}
