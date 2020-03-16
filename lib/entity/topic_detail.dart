import 'package:travel/entity/picture.dart';

class TopicDetail {
  int topicId;
  String name;
  Picture background;
  int momentNum;
  int visitedNum;
  int commentNum;
  String description;

  TopicDetail(
      {this.topicId,
      this.name,
      this.background,
      this.momentNum,
      this.visitedNum,
      this.commentNum,
      this.description});

  TopicDetail.fromJson(Map<String, dynamic> json) {
    topicId = json['topicId'];
    name = json['name'];
    background = json['background'] != null
        ? new Picture.fromJson(json['background'])
        : null;
    momentNum = json['momentNum'];
    visitedNum = json['visitedNum'];
    commentNum = json['commentNum'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topicId'] = this.topicId;
    data['name'] = this.name;
    if (this.background != null) {
      data['background'] = this.background.toJson();
    }
    data['momentNum'] = this.momentNum;
    data['visitedNum'] = this.visitedNum;
    data['commentNum'] = this.commentNum;
    data['description'] = this.description;
    return data;
  }
}
