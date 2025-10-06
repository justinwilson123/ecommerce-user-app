class OrderUnderDeliveryModel {
  int? orderId;
  int? orderUserid;
  int? orderLocation;
  String? orderTypeDelivery;
  double? orderPricedelivery;
  double? orderPrice;
  String? orderCoupon;
  String? orderPaymentmethod;
  String? orderDatetime;
  double? orderTotalePrice;
  String? orderStatus;
  int? rating;
  String? comment;
  int? deliveryId;
  double? lat;
  double? long;
  String? nameDelivery;
  String? phoneDelivery;

  OrderUnderDeliveryModel({
    this.orderId,
    this.orderUserid,
    this.orderLocation,
    this.orderTypeDelivery,
    this.orderPricedelivery,
    this.orderPrice,
    this.orderCoupon,
    this.orderPaymentmethod,
    this.orderDatetime,
    this.orderTotalePrice,
    this.orderStatus,
    this.rating,
    this.comment,
    this.deliveryId,
    this.lat,
    this.long,
    this.nameDelivery,
    this.phoneDelivery,
  });

  OrderUnderDeliveryModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserid = json['order_userid'];
    orderLocation = json['order_location'];
    orderTypeDelivery = json['order_type_delivery'];
    orderPricedelivery = json['order_pricedelivery'] + 0.0;
    orderPrice = json['order_price'] + 0.0;
    orderCoupon = json['order_coupon'];
    orderPaymentmethod = json['order_paymentmethod'];
    orderDatetime = json['order-datetime'];
    orderTotalePrice = json['order_totale_price'] + 0.0;
    orderStatus = json['order_status'];
    rating = json['rating'];
    comment = json['comment'];
    deliveryId = json['delivery_id'];
    lat = json["lat"];
    long = json["long"];
    nameDelivery = json['Name_delivery'];
    phoneDelivery = json["delivery_phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_userid'] = this.orderUserid;
    data['order_location'] = this.orderLocation;
    data['order_type_delivery'] = this.orderTypeDelivery;
    data['order_pricedelivery'] = this.orderPricedelivery;
    data['order_price'] = this.orderPrice;
    data['order_coupon'] = this.orderCoupon;
    data['order_paymentmethod'] = this.orderPaymentmethod;
    data['order-datetime'] = this.orderDatetime;
    data['order_totale_price'] = this.orderTotalePrice;
    data['order_status'] = this.orderStatus;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['delivery_id'] = this.deliveryId;
    data["lat"] = lat;
    data["long"] = long;
    data['Name_delivery'] = nameDelivery;
    data["delivery_phone"] = phoneDelivery;
    return data;
  }
}
