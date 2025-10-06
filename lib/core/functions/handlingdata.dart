import 'package:ecommerce/core/class/statusrequst.dart';

handlingData(response) {
  if (response is StatusRequst) {
    return response;
  } else {
    return StatusRequst.success;
  }
}
