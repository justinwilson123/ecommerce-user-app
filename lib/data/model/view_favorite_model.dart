class ViewFavoriteModel {
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
  double? rating;
  int? favoriteId;

  ViewFavoriteModel(
      {this.itemsId,
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
      this.rating,
      this.favoriteId});

  ViewFavoriteModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsNameEn = json['items_name_en'];
    itemsNameAr = json['items_name_ar'];
    itemsDescEn = json['items_desc_en'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'] + 0.0;
    itemsDiscount = json['items_discount'] + 0.0;
    itemsDate = json['items_date'];
    itemsCategoriesId = json['items_categories_id'];
    categoriesId = json['categories_id'];
    categoriesNameEn = json['categories_name_en'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    rating = double.parse(json['rating']);
    favoriteId = json['favorite_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name_en'] = this.itemsNameEn;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc_en'] = this.itemsDescEn;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_categories_id'] = this.itemsCategoriesId;
    data['categories_id'] = this.categoriesId;
    data['categories_name_en'] = this.categoriesNameEn;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    data['favorite_id'] = this.favoriteId;
    return data;
  }
}
