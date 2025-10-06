class CashbackModel {
  int? cashbackId;
  String? titleAr;
  String? titleEn;
  String? bodyAr;
  String? bodyEn;

  CashbackModel(
      {this.cashbackId, this.titleAr, this.titleEn, this.bodyAr, this.bodyEn});

  CashbackModel.fromJson(Map<String, dynamic> json) {
    cashbackId = json['cashback_id'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    bodyAr = json['body_ar'];
    bodyEn = json['body_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cashback_id'] = this.cashbackId;
    data['title_ar'] = this.titleAr;
    data['title_en'] = this.titleEn;
    data['body_ar'] = this.bodyAr;
    data['body_en'] = this.bodyEn;
    return data;
  }
}
