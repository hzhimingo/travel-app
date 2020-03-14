import 'package:travel/entity/picture.dart';

class AnswerCover {
  int answerId;
  String content;
  int favNum;
  int starNum;
  int commentNum;
  bool isStar;
  bool isFav;
  String date;
  String nickname;
  String avatar;
  List<Picture> pictures;

  AnswerCover({
    this.content,
    this.favNum,
    this.starNum,
    this.commentNum,
    this.isStar,
    this.isFav,
    this.date,
    this.nickname,
    this.avatar,
    this.pictures,
    this.answerId,
  });

  AnswerCover.fromJson(Map<String, dynamic> json) {
    answerId = json['answerId'];
    content = json['content'];
    favNum = json['favNum'];
    starNum = json['starNum'];
    commentNum = json['commentNum'];
    isStar = json['isStar'];
    isFav = json['isFav'];
    date = json['date'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    if (json['pictures'] != null) {
      pictures = new List<Picture>();
      json['pictures'].forEach((v) {
        pictures.add(new Picture.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answerId'] = this.answerId;
    data['content'] = this.content;
    data['favNum'] = this.favNum;
    data['starNum'] = this.starNum;
    data['commentNum'] = this.commentNum;
    data['isStar'] = this.isStar;
    data['isFav'] = this.isFav;
    data['date'] = this.date;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    if (this.pictures != null) {
      data['pictures'] = this.pictures.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
