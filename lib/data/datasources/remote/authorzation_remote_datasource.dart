import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/authorization.dart';

class AuthorizationRemoteDataSource {
  final Dio http;

  AuthorizationRemoteDataSource({this.http});

  Future<Authorization> getAuthorizedByPwd(
      String account, String password) async {
    var response = await http.post(
      '/account/normal/sign-in',
      data: {
        'account': account,
        'password': password,
      }
    );
    if (response.statusCode == 200) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        return Authorization.fromJson(result.data);
      } else {
        throw ApiException(msg: result.msg);
      }
    } else {
      throw ServerException();
    }
  }
}
