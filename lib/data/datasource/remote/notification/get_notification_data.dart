import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class GetNotificationData {
  Crud crud;
  GetNotificationData(this.crud);

  getNotificationData(String userid) async {
    var response = await crud.postData(Applink.getNotification, {
      "user_id_notification": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
