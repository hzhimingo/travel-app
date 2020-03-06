import 'package:travel/entity/user.dart';


class Authorization {
  User user;
  String token;
  String refreshToken;
  String date;

  Authorization({this.user, this.token, this.refreshToken, this.date});

  Authorization.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
    refreshToken = json['refreshToken'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    data['date'] = this.date;
    return data;
  }
}
