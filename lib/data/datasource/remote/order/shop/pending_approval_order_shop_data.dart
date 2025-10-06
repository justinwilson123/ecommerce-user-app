import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class PendingApprovalOrderShopData {
  Crud crud;
  PendingApprovalOrderShopData(this.crud);
  getData(String orderUserId) async {
    var response = await crud.postData(Applink.orderPendingAprrovalShop, {
      "order_userid": orderUserId,
    });
    return response.fold((l) => l, (r) => r);
  }

  deletData(String orderid) async {
    var response =
        await crud.postData(Applink.deleteOrder, {"order_id": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
