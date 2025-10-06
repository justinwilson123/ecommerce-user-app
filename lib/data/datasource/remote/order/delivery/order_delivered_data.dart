import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class OrderDeliveredData {
  Crud crud;
  OrderDeliveredData(this.crud);
  getData(String orderUserId) async {
    var response = await crud.postData(Applink.orderDelivered, {
      "order_userid": orderUserId,
    });
    return response.fold((l) => l, (r) => r);
  }

  sendData(
    String orderId,
    String orderUserId,
    String deliveryId,
    String accessToken,
  ) async {
    var response = await crud.postData(Applink.acceptOrderDeliveryArchive, {
      "order_id": orderId,
      "order_userid": orderUserId,
      "delivery_id": deliveryId,
      "accessToken": accessToken,
    });
    return response.fold((l) => l, (r) => r);
  }
}
