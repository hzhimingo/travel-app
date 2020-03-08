import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/entity/user.dart';

class UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSource({this.sharedPreferences});

  Future<bool> storeCurrentUser(User user) async {
    return await sharedPreferences.setString('CurrentUser', json.encode(user.toJson()));
  }

  Future<User> getLocalCurrentUser() async {
    var jsonStr = sharedPreferences.getString('CurrentUser');
    if (jsonStr == null) {
      throw CacheNotExistException();
    } else {
      return User.fromJson(json.decode(jsonStr));
    }
  }
  Future<bool> removeLocalCurrentUser() async {
    return await sharedPreferences.remove('CurrentUser');
  }
}