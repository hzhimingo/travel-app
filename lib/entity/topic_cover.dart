import 'package:travel/entity/moment_cover.dart';
import 'package:travel/entity/picture.dart';

class TopicCover {
  int topicId;
  String name;
  int momentNum;
  int commentNum;
  Picture coverImage;
  List<MomentCover> momentCovers;

  TopicCover(
      {this.topicId,
      this.name,
      this.momentNum,
      this.commentNum,
      this.coverImage,
      this.momentCovers});

  TopicCover.fromJson(Map<String, dynamic> json) {
    topicId = json['topicId'];
    name = json['name'];
    momentNum = json['momentNum'];
    commentNum = json['commentNum'];
    coverImage = json['coverImage'] != null
        ? new Picture.fromJson(json['coverImage'])
        : null;
    if (json['momentCovers'] != null) {
      momentCovers = new List<MomentCover>();
      json['momentCovers'].forEach((v) {
        momentCovers.add(new MomentCover.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topicId'] = this.topicId;
    data['name'] = this.name;
    data['momentNum'] = this.momentNum;
    data['commentNum'] = this.commentNum;
    if (this.coverImage != null) {
      data['coverImage'] = this.coverImage.toJson();
    }
    if (this.momentCovers != null) {
      data['momentCovers'] = this.momentCovers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}