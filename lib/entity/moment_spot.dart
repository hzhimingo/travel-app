class MomentSpot {
  int countryId;
  String countryName;
  int province;
  String provinceName;
  int city;
  String cityName;
  int area;
  String areaName;
  int spotId;
  String spotName;

  MomentSpot(
      {this.countryId,
      this.countryName,
      this.province,
      this.provinceName,
      this.city,
      this.cityName,
      this.area,
      this.areaName,
      this.spotId,
      this.spotName});

  MomentSpot.fromJson(Map<String, dynamic> json) {
    countryId = json['countryId'];
    countryName = json['countryName'];
    province = json['province'];
    provinceName = json['provinceName'];
    city = json['city'];
    cityName = json['cityName'];
    area = json['area'];
    areaName = json['areaName'];
    spotId = json['spotId'];
    spotName = json['spotName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryId'] = this.countryId;
    data['countryName'] = this.countryName;
    data['province'] = this.province;
    data['provinceName'] = this.provinceName;
    data['city'] = this.city;
    data['cityName'] = this.cityName;
    data['area'] = this.area;
    data['areaName'] = this.areaName;
    data['spotId'] = this.spotId;
    data['spotName'] = this.spotName;
    return data;
  }
}