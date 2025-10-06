class ReviewItemModel {
  int? userid;
  String? username;
  String? imageUser;
  String? comment;
  int? rating;

  ReviewItemModel(
      {this.userid, this.username, this.imageUser, this.comment, this.rating});

  ReviewItemModel.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    username = json['username'];
    imageUser = json['image_user'];
    comment = json['comment'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['username'] = this.username;
    data['image_user'] = this.imageUser;
    data['comment'] = this.comment;
    data['rating'] = this.rating;
    return data;
  }
}
