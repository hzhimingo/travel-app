class CommentCover {
  int commentId;
  int authorId;
  String authorNickname;
  String authorAvatar;
  String content;
  String time;

  CommentCover({
    this.commentId,
    this.authorId,
    this.authorAvatar,
    this.authorNickname,
    this.content,
    this.time,
  });

  CommentCover.fromJson(Map<String, dynamic> json) {
    commentId = json['commentId'];
    authorId = json['authorId'];
    authorNickname = json['authorNickname'];
    authorAvatar = json['authorAvatar'];
    content = json['content'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentId'] = this.commentId;
    data['authorId'] = this.authorId;
    data['authorNickname'] = this.authorNickname;
    data['authorAvatar'] = this.authorAvatar;
    data['content'] = this.content;
    data['time'] = this.time;
    return data;
  }
}