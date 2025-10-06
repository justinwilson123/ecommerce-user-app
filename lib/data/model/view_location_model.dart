class ViewLocationModel {
  int? locationId;
  String? country;
  String? state;
  String? city;
  String? street;
  double? longtudes;
  double? latitudes;
  int? locationUserId;
  String? namelocation;
  String? detailsLocation;

  ViewLocationModel(
      {this.locationId,
      this.country,
      this.state,
      this.city,
      this.street,
      this.longtudes,
      this.latitudes,
      this.locationUserId,
      this.namelocation,
      this.detailsLocation});

  ViewLocationModel.fromJson(Map<String, dynamic> json) {
    locationId = json['location_id'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    street = json['street'];
    longtudes = json['longtudes'] + 0.0;
    latitudes = json['latitudes'] + 0.0;
    locationUserId = json['location_user_id'];
    namelocation = json['namelocation'];
    detailsLocation = json['details_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location_id'] = this.locationId;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['street'] = this.street;
    data['longtudes'] = this.longtudes;
    data['latitudes'] = this.latitudes;
    data['location_user_id'] = this.locationUserId;
    data['namelocation'] = this.namelocation;
    data['details_location'] = this.detailsLocation;
    return data;
  }
}
