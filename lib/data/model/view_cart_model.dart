class ViewCartModel {
  String? itemsprices;
  int? countitems;
  int? cartId;
  int? cartUserId;
  int? cartItemId;
  int? itemsId;
  String? itemsNameEn;
  String? itemsNameAr;
  String? itemsDescEn;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  double? itemsPrice;
  double? itemsDiscount;
  String? itemsDate;
  int? itemsCategoriesId;

  ViewCartModel({
    this.itemsprices,
    this.countitems,
    this.cartId,
    this.cartUserId,
    this.cartItemId,
    this.itemsId,
    this.itemsNameEn,
    this.itemsNameAr,
    this.itemsDescEn,
    this.itemsDescAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCategoriesId,
  });

  ViewCartModel.fromJson(Map<String, dynamic> json) {
    itemsprices = json['itemsprices'].toString();
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUserId = json['cart_user_id'];
    cartItemId = json['cart_item_id'];
    itemsId = json['items_id'];
    itemsNameEn = json['items_name_en'];
    itemsNameAr = json['items_name_ar'];
    itemsDescEn = json['items_desc_en'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = double.parse(json['items_price']) + 0.0;
    itemsDiscount = json['items_discount'] + 0.0;
    itemsDate = json['items_date'];
    itemsCategoriesId = json['items_categories_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['itemsprices'] = itemsprices;
    data['countitems'] = countitems;
    data['cart_id'] = cartId;
    data['cart_user_id'] = cartUserId;
    data['cart_item_id'] = cartItemId;
    data['items_id'] = itemsId;
    data['items_name_en'] = itemsNameEn;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc_en'] = itemsDescEn;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_date'] = itemsDate;
    data['items_categories_id'] = itemsCategoriesId;
    return data;
  }
}
