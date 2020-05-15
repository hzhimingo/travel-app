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
      '/authorize/oauth/token',
      data: {
        'grant_type': "pwd",
        'username': account,
        'password': password,
        'scope': "read write",
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization': "Basic VHJhdmVsQXBwOjEyMzQ1Ng==",
        }
      ),
    ).catchError((e) {
      throw ServerException();
    });
    if (response.statusCode == 200) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        return Authorization.fromJson(result.data);
      } else {
        throw ApiException(msg: result.msg);
      }
    } else {
      print("ERROR");
      throw ServerException();
    }
  }

  Future<Authorization> getAuthorizedBySMSCode(
      String mobile, String code) async {
    var response = await http.post(
      '/authorize/oauth/token',
      data: {
        'grant_type': "sms",
        'mobile': mobile,
        'smsCode': code,
        'smsKey': "USER_SIGN_IN",
        'scope': "read write",
      },
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization': "Basic VHJhdmVsQXBwOjEyMzQ1Ng==",
        }
      ),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('Hello');
      print(response.data);
      Authorization authorization = Authorization.fromJson(response.data);
      print(authorization.accessToken);
      return Authorization.fromJson(response.data);
    } else {
      print("ERROR");
      throw ServerException();
    }
  }
}
