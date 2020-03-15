class QuestionDetail {
  int questionId;
  String title;
  String content;
  int visitedNum;
  int answerNum;
  String nickname;
  String date;
  List<String> tags;
  int authorId;
  String avatar;

  QuestionDetail(
      {this.questionId,
      this.title,
      this.content,
      this.visitedNum,
      this.answerNum,
      this.nickname,
      this.date,
      this.tags,
      this.authorId,
      this.avatar});

  QuestionDetail.fromJson(Map<String, dynamic> json) {
    questionId = json['questionId'];
    title = json['title'];
    content = json['content'];
    visitedNum = json['visitedNum'];
    answerNum = json['answerNum'];
    nickname = json['nickname'];
    date = json['date'];
    tags = json['tags'].cast<String>();
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
    data['tags'] = this.tags;
    data['authorId'] = this.authorId;
    data['avatar'] = this.avatar;
    return data;
  }
}