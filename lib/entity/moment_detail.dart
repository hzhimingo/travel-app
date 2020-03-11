import 'package:travel/entity/picture.dart';
import 'package:travel/entity/spot.dart';

class MomentDetail {
  int momentId;
  String title;
  String content;
  String releaseDate;
  String takeDate;
  String country;
  String city;
  String locationName;
  int authorId;
  String avatar;
  String nickname;
  List<Picture> pictures;
  Spot spot;
  int commentNum;
  int favNum;
  int starNum;
  int isFav;
  int isStar;
  List<String> favUsers;

  MomentDetail({
    this.content,
    this.releaseDate,
    this.takeDate,
    this.country,
    this.city,
    this.authorId,
    this.avatar,
    this.nickname,
    this.pictures,
    this.title,
    this.spot,
    this.commentNum,
    this.favNum,
    this.starNum,
    this.favUsers,
    this.momentId,
    this.isFav,
    this.isStar,
    this.locationName,
  });

  MomentDetail.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    releaseDate = json['releaseDate'];
    takeDate = json['takeDate'];
    country = json['country'];
    city = json['city'];
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
    spot = json['spot'] != null ? new Spot.fromJson(json['spot']) : null;
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
    data['authorId'] = this.authorId;
    data['avatar'] = this.avatar;
    data['nickname'] = this.nickname;
    if (this.pictures != null) {
      data['pictures'] = this.pictures.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    if (this.spot != null) {
      data['spot'] = this.spot.toJson();
    }
    data['commentNum'] = this.commentNum;
    data['favNum'] = this.favNum;
    data['starNum'] = this.starNum;
    data['favUsers'] = this.favUsers;
    data['momentId'] = this.momentId;
    return data;
  }
}
