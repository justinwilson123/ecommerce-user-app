import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class OrderPendingApprovalDeliveryData {
  Crud crud;
  OrderPendingApprovalDeliveryData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(Applink.orderPendingApprovalDelivery, {
      "order_userid": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deletData(String orderid) async {
    var response = await crud.postData(Applink.deleteOrder, {
      "order_id": orderid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
