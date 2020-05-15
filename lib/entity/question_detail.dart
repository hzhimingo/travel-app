class QuestionDetail {
  int questionId;
  String title;
  String content;
  int visitedNum;
  int answerNum;
  String nickname;
  String date;
  int authorId;
  String avatar;
  bool isCollect;

  QuestionDetail(
      {this.questionId,
      this.title,
      this.content,
      this.visitedNum,
      this.answerNum,
      this.nickname,
      this.date,
      this.authorId,
      this.avatar,
      this.isCollect});

  QuestionDetail.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    title = json['title'];
    content = json['content'];
    visitedNum = json['visitedNum'];
    answerNum = json['answerNum'];
    nickname = json['nickname'];
    date = json['date'];
    isCollect = json['isCollect'];
    authorId = json['authorId'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questionId'] = this.questionId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['visitedNum'] = this.visitedNum;
    data['answerNum'] = this.answerNum;
    data['nickname'] = this.nickname;
    data['date'] = this.date;
    data['isCollect'] = this.isCollect;
    data['authorId'] = this.authorId;
    data['avatar'] = this.avatar;
    return data;
  }
}