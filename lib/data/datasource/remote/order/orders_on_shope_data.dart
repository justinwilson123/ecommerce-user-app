import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class OrdersOnShopeData {
  Crud crud;
  OrdersOnShopeData(this.crud);

  getData(String userid) async {
    var response =
        await crud.postData(Applink.ordersOnShope, {"order_userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
