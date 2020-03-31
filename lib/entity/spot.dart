class Spot {
  int spotId;
  int score;
  int scoreNum;
  int starNum;
  String area;
  bool isStar;
  String name;
  String keyword;
  String coverImage;

  Spot({
    this.spotId,
    this.score,
    this.scoreNum,
    this.starNum,
    this.area,
    this.isStar,
    this.name,
    this.keyword,
    this.coverImage,
  });

  Spot.fromJson(Map<String, dynamic> json) {
    spotId = json['spot_id'];
    score = json['score'];
    scoreNum = json['scoreNum'];
    starNum = json['starNum'];
    area = json['area'];
    isStar = json['isStar'];
    name = json['name'];
    keyword = json['keyword'];
    coverImage = json['cover_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spot_id'] = this.spotId;
    data['score'] = this.score;
    data['scoreNum'] = this.scoreNum;
    data['starNum'] = this.starNum;
    data['area'] = this.area;
    data['isStar'] = this.isStar;
    data['name'] = this.name;
    data['keyword'] = this.keyword;
    data['cover_image'] = this.coverImage;
    return data;
  }
}
