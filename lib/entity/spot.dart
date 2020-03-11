class Spot {
  int spotId;
  String name;
  int type;
  String thumbnail;
  int commentNum;
  String address;
  String city;
  String area;

  Spot(
      {this.spotId,
      this.name,
      this.type,
      this.thumbnail,
      this.commentNum,
      this.address,
      this.city,
      this.area});

  Spot.fromJson(Map<String, dynamic> json) {
    spotId = json['spotId'];
    name = json['name'];
    type = json['type'];
    thumbnail = json['thumbnail'];
    commentNum = json['commentNum'];
    address = json['address'];
    city = json['city'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotId'] = this.spotId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['thumbnail'] = this.thumbnail;
    data['commentNum'] = this.commentNum;
    data['address'] = this.address;
    data['city'] = this.city;
    data['area'] = this.area;
    return data;
  }
}