import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class OrderStatePrepareDeliveyData {
  Crud crud;
  OrderStatePrepareDeliveyData(this.crud);
  getData(String orderUserId) async {
    var response = await crud.postData(Applink.orderStatePrepareDelivery, {
      "order_userid": orderUserId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
