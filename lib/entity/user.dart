class User {
  int userId;
  String nickname;
  String avatar;
  String background;
  String introduction;
  int level;
  int followNum;
  int fansNum;
  int visitedNum;
  String telephone;

  User(
      {this.userId,
      this.nickname,
      this.avatar,
      this.background,
      this.introduction,
      this.level,
      this.followNum,
      this.fansNum,
      this.visitedNum,
      this.telephone});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    background = json['background'];
    introduction = json['introduction'];
    level = json['level'];
    followNum = json['followNum'];
    fansNum = json['fansNum'];
    visitedNum = json['visitedNum'];
    telephone = json['telephone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['nickname'] = this.nickname;
    data['avatar'] = this.avatar;
    data['background'] = this.background;
    data['introduction'] = this.introduction;
    data['level'] = this.level;
    data['followNum'] = this.followNum;
    data['fansNum'] = this.fansNum;
    data['visitedNum'] = this.visitedNum;
    data['telephone'] = this.telephone;
    return data;
  }
}
