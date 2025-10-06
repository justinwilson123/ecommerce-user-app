import 'package:ecommerce/core/class/crud.dart';
import 'package:ecommerce/core/constant/linkipa.dart';

class CheckOutData {
  Crud crud;
  CheckOutData(this.crud);

  viewshpoe() async {
    var response = await crud.postData(Applink.viewshop, {});
    return response.fold((l) => l, (r) => r);
  }

  checkoutOrder(
    String orderUserId,
    String orderLocation,
    String orderTypeDelivery,
    String orderPriceDelivery,
    String orderPrice,
    String orderCoupon,
    String orderPaymentMethod,
    String ordertotaleprice,
  ) async {
    var response = await crud.postData(Applink.checkout, {
      "order_userid": orderUserId,
      "order_location": orderLocation,
      "order_type_delivery": orderTypeDelivery,
      "order_pricedelivery": orderPriceDelivery,
      "order_price": orderPrice,
      "order_coupon": orderCoupon,
      "order_paymentmethod": orderPaymentMethod,
      "order_totale_price": ordertotaleprice,
    });
    return response.fold((l) => l, (r) => r);
  }
}
