import 'package:travel/entity/comment_cover.dart';
import 'package:travel/entity/picture.dart';

class AnswerDetailData {
  int answerId;
  String content;
  int authorId;
  String nickname;
  String avatar;
  String date;
  String question;
  int questionId;
  int answerNum;
  List<Picture> pictures;
  int favNum;
  int starNum;
  int commentNum;
  bool isStar;
  bool isFav;
  List<CommentCover> comments;

  AnswerDetailData(
      {this.answerId,
      this.content,
      this.authorId,
      this.nickname,
      this.avatar,
      this.date,
      this.question,
      this.questionId,
      this.answerNum,
      this.pictures,
      this.favNum,
      this.starNum,
      this.commentNum,
      this.isStar,
      this.isFav,
      this.comments,
  });

  AnswerDetailData.fromJson(Map<String, dynamic> json) {
    answerId = json['answerId'];
    content = json['content'];
    authorId = json['authorId'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    date = json['date'];
    question = json['question'];
    questionId = json['questionId'];
    answerNum = json['answerNum'];
    if (json['pictures'] != null) {
      pictures = new List<Picture>();
      json['pictures'].forEach((v) {
        pictures.add(new Picture.fromJson(v));
      });
    }
    favNum = json['favNum'];
    starNum = json['starNum'];
    commentNum = json['commentNum'];
    isStar = json['isStar'];
    isFav = json['isFav'];
    comments = new List<CommentCover>();
    if (json['comments'] != null) {
      json['comments'].forEach((v) {
        comments.add(new CommentCover.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answerId'] = this.answerId;
    data['content'] = this.content;
    data['authorId'] = this.authorId;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    data['date'] = this.date;
    data['question'] = this.question;
    data['questionId'] = this.questionId;
    data['answerNum'] = this.answerNum;
    if (this.pictures != null) {
      data['pictures'] = this.pictures.map((v) => v.toJson()).toList();
    }
    data['favNum'] = this.favNum;
    data['starNum'] = this.starNum;
    data['commentNum'] = this.commentNum;
    data['isStar'] = this.isStar;
    data['isFav'] = this.isFav;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}