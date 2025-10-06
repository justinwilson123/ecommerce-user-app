import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  addfcart(
    String userid,
    String itemid,
    String itemPrice,
    String itemNameEn,
    String itemNameAr,
    String itmeImageName,
  ) async {
    var response = await crud.postData(Applink.addcart, {
      "cart_user_id": userid,
      "cart_item_id": itemid,
      "item_price": itemPrice,
      "item_name_en": itemNameEn,
      "item_name_ar": itemNameAr,
      "item_image_name": itmeImageName,
    });
    return response.fold((l) => l, (r) => r);
  }

  deletecart(userid, itemid) async {
    var response = await crud.postData(Applink.deletcart, {
      "cart_user_id": userid,
      "cart_item_id": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }

  countcart(userid, itemid) async {
    var response = await crud.postData(Applink.countcart, {
      "cart_user_id": userid,
      "cart_item_id": itemid,
    });
    return response.fold((l) => l, (r) => r);
  }

  viewcart(userid) async {
    var response = await crud.postData(Applink.viewcart, {
      "cart_user_id": userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addCoupon(couponName) async {
    var response = await crud.postData(Applink.addCoupon, {
      "coupon_name": couponName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
