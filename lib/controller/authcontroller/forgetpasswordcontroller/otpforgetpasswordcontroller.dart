import 'package:get/get.dart';
import 'package:ecommerce/core/class/statusrequst.dart';
import 'package:ecommerce/core/constant/routesapp.dart';
import 'package:ecommerce/core/functions/handlingdata.dart';
import 'package:ecommerce/data/datasource/remote/auth/fotgetpass/otpforgetpassworddata.dart';

abstract class OtpForgetPasswordController extends GetxController {
  String? useremail;
  StatusRequst statusRequst = StatusRequst.nothing;
  OtpForgetPasswordData otpForgetPasswordData = OtpForgetPasswordData(
    Get.find(),
  );
  verifiAndGoToLogin(String code);
}

class OtpForgetPasswordControllerImp extends OtpForgetPasswordController {
  @override
  verifiAndGoToLogin(String code) async {
    statusRequst = StatusRequst.loading;
    update();
    var response = await otpForgetPasswordData.getData(useremail!, code);
    statusRequst = handlingData(response);
    if (StatusRequst.success == statusRequst) {
      if (response['status'] == "success") {
        Get.snackbar("43".tr, "47".tr);
        Get.offNamed(AppRoutes.newpassword, arguments: {"reemail": useremail});
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
// if (code == "54321") {
      
//     } else {
      
//     }