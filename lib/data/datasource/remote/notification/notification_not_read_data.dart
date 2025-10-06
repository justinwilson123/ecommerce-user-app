import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class NotificationNotReadData {
  Crud crud;
  NotificationNotReadData(this.crud);
  getNotificationNotRead(String userid) async {
    var response = await crud.postData(Applink.getNotificationNotRead, {
      "user_id_notification": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  readAllNotification(String userid) async {
    var response = await crud.postData(Applink.readAllNotification, {
      "user_id_notification": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
