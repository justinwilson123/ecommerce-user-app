import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class OrdersUnderDeliveryData {
  Crud crud;
  OrdersUnderDeliveryData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(Applink.ordersUnderDelivery, {
      "order_userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
