import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class OrderDetailsData {
  Crud crud;

  OrderDetailsData(this.crud);

  getData(
    String orderid,
    String userid,
  ) async {
    var response = await crud.postData(
      Applink.orderDetails,
      {
        "order_id": orderid,
        "cart_user_id": userid,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  insertData(String ratingUserId, String ratingItemid, String rating,
      String comment) async {
    var response = await crud.postData(
      Applink.ratingItem,
      {
        "rating_user_id": ratingUserId,
        "rating_item_id": ratingItemid,
        "rating": rating,
        "comment": comment,
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  foundData(String itemsId) async {
    var response = await crud.postData(
      Applink.itemFoundOrNo,
      {
        "items_id": itemsId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
