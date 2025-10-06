import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class OrderArchiveData {
  Crud crud;
  OrderArchiveData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(
      Applink.orderArchive,
      {"order_userid": userid},
    );
    return response.fold((l) => l, (r) => r);
  }

  updateData(String orderid, String rating, String comment) async {
    var response = await crud.postData(
      Applink.ratingOrder,
      {
        "order_id": orderid,
        "rating": rating,
        "comment": comment,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
