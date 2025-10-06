import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class OrderPrepareShopData {
  Crud crud;
  OrderPrepareShopData(this.crud);
  getData(String orderUserId) async {
    var response = await crud.postData(Applink.orderPrepareShop, {
      "order_userid": orderUserId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
