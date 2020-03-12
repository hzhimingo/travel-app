import 'package:travel/entity/picture.dart';
import 'package:travel/entity/spot.dart';

class MomentDetail {
  String content;
  String releaseDate;
  String takeDate;
  String country;
  String city;
  bool isFav;
  bool isStar;
  String locationName;
  int authorId;
  String avatar;
  String nickname;
  List<Picture> pictures;
  String title;
  List<Spot> spots;
  int commentNum;
  int favNum;
  int starNum;
  List<String> favUsers;
  int momentId;

  MomentDetail(
      {this.content,
      this.releaseDate,
      this.takeDate,
      this.country,
      this.city,
      this.isFav,
      this.isStar,
      this.locationName,
      this.authorId,
      this.avatar,
      this.nickname,
      this.pictures,
      this.title,
      this.spots,
      this.commentNum,
      this.favNum,
      this.starNum,
      this.favUsers,
      this.momentId});

  MomentDetail.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    releaseDate = json['releaseDate'];
    takeDate = json['takeDate'];
    country = json['country'];
    city = json['city'];
    isFav = json['isFav'];
    isStar = json['isStar'];
    locationName = json['locationName'];
    authorId = json['authorId'];
    avatar = json['avatar'];
    nickname = json['nickname'];
    if (json['pictures'] != null) {
      pictures = new List<Picture>();
      json['pictures'].forEach((v) {
        pictures.add(new Picture.fromJson(v));
      });
    }
    title = json['title'];
    if (json['spot'] != null) {
      spots = new List<Spot>();
      json['spot'].forEach((v) {
        spots.add(new Spot.fromJson(v));
      });
    }
    commentNum = json['commentNum'];
    favNum = json['favNum'];
    starNum = json['starNum'];
    favUsers = json['favUsers'].cast<String>();
    momentId = json['momentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['releaseDate'] = this.releaseDate;
    data['takeDate'] = this.takeDate;
    data['country'] = this.country;
    data['city'] = this.city;
    data['isFav'] = this.isFav;
    data['isStar'] = this.isStar;
    data['locationName'] = this.locationName;
    data['authorId'] = this.authorId;
    data['avatar'] = this.avatar;
    data['nickname'] = this.nickname;
    if (this.pictures != null) {
      data['pictures'] = this.pictures.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    if (this.spots != null) {
      data['spot'] = this.spots.map((v) => v.toJson()).toList();
    }
    data['commentNum'] = this.commentNum;
    data['favNum'] = this.favNum;
    data['starNum'] = this.starNum;
    data['favUsers'] = this.favUsers;
    data['momentId'] = this.momentId;
    return data;
  }
}
