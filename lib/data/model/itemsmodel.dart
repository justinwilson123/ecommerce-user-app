class ItemsModel {
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
  int? categoriesId;
  String? categoriesNameEn;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  int? favoriteactiv;
  String? itemsPriceDiscount;
  double? rating;

  ItemsModel({
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
    this.categoriesId,
    this.categoriesNameEn,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesDatetime,
    this.favoriteactiv,
    this.rating,
    this.itemsPriceDiscount,
  });

  ItemsModel.fromJson(Map<String, dynamic> json) {
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
    categoriesId = json['categories_id'];
    categoriesNameEn = json['categories_name_en'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favoriteactiv = json['favoriteactiv'];
    rating = double.parse(json['rating']);
    itemsPriceDiscount = json['items_price_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['categories_id'] = categoriesId;
    data['categories_name_en'] = categoriesNameEn;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    data['favoriteactiv'] = favoriteactiv;
    data['rating'] = rating;
    data['items_price_discount'] = itemsPriceDiscount;
    return data;
  }
}
