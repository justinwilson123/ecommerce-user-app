class CouponModel {
  int? couponId;
  String? couponName;
  int? couponNumbur;
  double? couponDisacount;
  String? couponEnddate;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponNumbur,
      this.couponDisacount,
      this.couponEnddate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponNumbur = json['coupon_numbur'];
    couponDisacount = json['coupon_disacount'] + 0.0;
    couponEnddate = json['coupon_enddate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_numbur'] = this.couponNumbur;
    data['coupon_disacount'] = this.couponDisacount;
    data['coupon_enddate'] = this.couponEnddate;
    return data;
  }
}
