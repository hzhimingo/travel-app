class SimpleSpot {
  int spotId;
  String spotName;
  String address;
  String cityName;
  int cityId;

  SimpleSpot({
    this.spotId,
    this.spotName,
    this.address,
    this.cityId,
    this.cityName,
  });

  SimpleSpot.fromJson(Map<String, dynamic> json) {
    spotId = json['spotId'];
    spotName = json['spotName'];
    address = json['address'];
    cityId = json['cityId'];
    cityName = json['cityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotId'] = this.spotId;
    data['spotName'] = this.spotName;
    data['address'] = this.address;
    data['cityId'] = this.cityId;
    data['cityName'] = this.cityName;
    return data;
  }
}