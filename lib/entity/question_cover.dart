import 'package:travel/entity/answer_cover.dart';

class QuestionCover {
  int questionId;
  String title;
  int visitedNum;
  int answerNum;
  int followNum;
  AnswerCover answer;
  List<String> tags;

  QuestionCover(
      {this.questionId,
      this.title,
      this.visitedNum,
      this.answerNum,
      this.followNum,
      this.answer,
      this.tags});

  QuestionCover.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    title = json['title'];
    visitedNum = json['visitedNum'];
    answerNum = json['answerNum'];
    followNum = json['followNum'];
    answer =
        json['answer'] != null ? new AnswerCover.fromJson(json['answer']) : null;
    if (json['tags'] != null) {
      tags = json['tags'].cast<String>();
    } else {
      tags = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionId'] = this.questionId;
    data['title'] = this.title;
    data['visitedNum'] = this.visitedNum;
    data['answerNum'] = this.answerNum;
    data['followNum'] = this.followNum;
    if (this.answer != null) {
      data['answer'] = this.answer.toJson();
    }
    data['tags'] = this.tags;
    return data;
  }
}