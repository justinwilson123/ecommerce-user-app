import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/signup/otpsingupdata.dart';

abstract class OtpSigUpController extends GetxController {
  verifiAndGoToLogin(String code);
}

class OtpSignUpControllerImp extends OtpSigUpController {
  String? useremail;
  StatusRequst statusRequst = StatusRequst.nothing;
  OtpSignUpData otpSignUpData = OtpSignUpData(Get.find());

  @override
  verifiAndGoToLogin(String code) async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await otpSignUpData.postData(useremail!, code);
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
    useremail = Get.arguments['email'];
    super.onInit();
  }
}
