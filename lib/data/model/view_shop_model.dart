class ViewShopModel {
  int? ourshopeId;
  String? ourshopeNameEn;
  String? ourshopeNameAr;
  String? detialsLocation;

  ViewShopModel(
      {this.ourshopeId,
      this.ourshopeNameEn,
      this.ourshopeNameAr,
      this.detialsLocation});

  ViewShopModel.fromJson(Map<String, dynamic> json) {
    ourshopeId = json['ourshope_id'];
    ourshopeNameEn = json['ourshope_name_en'];
    ourshopeNameAr = json['ourshope_name_ar'];
    detialsLocation = json['detials_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ourshope_id'] = this.ourshopeId;
    data['ourshope_name_en'] = this.ourshopeNameEn;
    data['ourshope_name_ar'] = this.ourshopeNameAr;
    data['detials_location'] = this.detialsLocation;
    return data;
  }
}
