import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class UnderPrepareOrderData {
  Crud crud;
  UnderPrepareOrderData(this.crud);
  getData(String orderUserId) async {
    var response = await crud.postData(Applink.orderUnderPrepareShop, {
      "order_userid": orderUserId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
