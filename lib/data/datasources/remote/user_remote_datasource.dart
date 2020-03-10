import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/user.dart';

class UserRemoteDataSource {
  final Dio http;

  UserRemoteDataSource({this.http});

  Future<User> getUserInfo(int userId) async {
    var response = await http.get(
      '/user',
      queryParameters: {
        'userId': userId,
      },
    );
    if (response.statusCode == 200) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        return User.fromJson(result.data);
      } else {
        throw ApiException(msg: result.msg);
      }
    } else {
      throw ServerException();
    }
  }
}
