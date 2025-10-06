class OrderDetailsModel {
  int? sumitems;
  double? sumprice;
  int? cartId;
  int? cartUserId;
  int? cartItemId;
  int? orderId;
  double? itemPrice;
  String? itemNameEn;
  String? itemNameAr;
  String? itemImageName;

  OrderDetailsModel({
    this.sumitems,
    this.sumprice,
    this.cartId,
    this.cartUserId,
    this.cartItemId,
    this.orderId,
    this.itemPrice,
    this.itemNameEn,
    this.itemNameAr,
    this.itemImageName,
  });

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    sumitems = json['countitems'];
    sumprice =
        double.parse(json['itemsprices'].toString().replaceAll(",", "")) + 0.0;
    cartId = json['cart_id'];
    cartUserId = json['cart_user_id'];
    cartItemId = json['cart_item_id'];
    orderId = json['order_id'];
    itemPrice = double.parse(json['item_price']) + 0.0;
    itemNameEn = json['item_name_en'];
    itemNameAr = json['item_name_ar'];
    itemImageName = json['item_image_name'];
  }
  //  {
  //           "itemsprices": 1817.8182,
  //           "countitems": 2,
  //           "cart_id": 3,
  //           "cart_item_id": 2,
  //           "cart_user_id": 43,
  //           "item_image_name": "mobiles23ultra.jpg",
  //           "item_name_ar": "سامسونغ جالاكسي اس23 الترا",
  //           "item_name_en": "samsung galaxy s23 ultra  ",
  //           "item_price": 908.9091,
  //           "order_id": 3,
  //           "items_id": 2,
  //           "items_name_en": "samsung galaxy s23 ultra  ",
  //           "items_name_ar": "سامسونغ جالاكسي اس23 الترا",
  //           "items_desc_en": "new samsung mobile for 2023 with snapdragon processor ",
  //           "items_desc_ar": "هاتف سامسونغ الرائد الجديد لعام 2023 بمعالج سناب دراجون",
  //           "items_image": "mobiles23ultra.jpg",
  //           "items_count": 50,
  //           "items_active": 1,
  //           "items_price": 999.9,
  //           "items_discount": 9.1,
  //           "items_date": "2024-07-26 19:20:14",
  //           "items_categories_id": 2
  //       },

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sumitems'] = this.sumitems;
    data['sumprice'] = this.sumprice;
    data['cart_id'] = this.cartId;
    data['cart_user_id'] = this.cartUserId;
    data['cart_item_id'] = this.cartItemId;
    data['order_id'] = this.orderId;
    data['item_price'] = this.itemPrice;
    data['item_name_en'] = this.itemNameEn;
    data['item_name_ar'] = this.itemNameAr;
    data['item_image_name'] = this.itemImageName;
    return data;
  }
}
