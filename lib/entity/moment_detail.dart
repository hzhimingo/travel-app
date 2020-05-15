import 'package:travel/entity/comment_cover.dart';
import 'package:travel/entity/moment_spot.dart';
import 'package:travel/entity/picture.dart';

class MomentDetail {
  int momentId;
  String title;
  String content;
  int authorId;
  String nickname;
  String avatar;
  List<Picture> pictures;
  int starNum;
  int favNum;
  int commentNum;
  bool isFav;
  bool isCollect;
  String releaseDate;
  MomentSpot spot;
  List<String> favUser;
  List<CommentCover> comments;

  MomentDetail(
      {this.momentId,
      this.title,
      this.content,
      this.authorId,
      this.nickname,
      this.avatar,
      this.pictures,
      this.starNum,
      this.favNum,
      this.commentNum,
      this.isFav,
      this.isCollect,
      this.releaseDate,
      this.spot,
      this.comments,
      this.favUser,});

  MomentDetail.fromJson(Map<String, dynamic> json) {
    momentId = json['momentId'];
    title = json['title'];
    content = json['content'];
    authorId = json['authorId'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    if (json['pictures'] != null) {
      pictures = new List<Picture>();
      json['pictures'].forEach((v) {
        pictures.add(new Picture.fromJson(v));
      });
    }
    if (json['favUser'] != null) {
      favUser = json['favUser'].cast<String>();
    } else {
      favUser = [];
    }
    comments = new List<CommentCover>();
    if (json['comments'] != null) {
      json['comments'].forEach((v) {
        comments.add(new CommentCover.fromJson(v));
      });
    }
    starNum = json['starNum'];
    favNum = json['favNum'];
    commentNum = json['commentNum'];
    isFav = json['isFav'];
    isCollect = json['isCollect'];
    releaseDate = json['releaseDate'];
    spot = json['spot'] != null ? new MomentSpot.fromJson(json['spot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['momentId'] = this.momentId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['authorId'] = this.authorId;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    if (this.pictures != null) {
      data['pictures'] = this.pictures.map((v) => v.toJson()).toList();
    }
    data['starNum'] = this.starNum;
    data['favNum'] = this.favNum;
    data['commentNum'] = this.commentNum;
    data['isFav'] = this.isFav;
    data['isCollect'] = this.isCollect;
    data['releaseDate'] = this.releaseDate;
    data['favUser'] = this.favUser;
    if (this.spot != null) {
      data['spot'] = this.spot.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}