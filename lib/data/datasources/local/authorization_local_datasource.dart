import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/entity/authorization.dart';

class AuthorizationLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthorizationLocalDataSource({this.sharedPreferences});

  Future<void> storeAuthorization(Authorization authorization) async {
    return sharedPreferences.setString(
      'Authorization',
      json.encode(
        authorization.toJson(),
      ),
    );
  }

  Future<Authorization> getAuthorized() async {
    var jsonStr = sharedPreferences.getString('Authorization');
    if (jsonStr == null) {
      throw CacheNotExistException();
    } else {
      return Authorization.fromJson(json.decode(jsonStr));
    }
  }

  Future<void> removeAuthorized() async {
    return await sharedPreferences.remove('Authorization');
  }
}
