import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/authorization.dart';

class AuthorizationRemoteDataSource {
  final Dio http;

  AuthorizationRemoteDataSource({this.http});

  Future<Authorization> getAuthorizedByPwd(
      String account, String password) async {
        Authorization authorization;
        await http
        .post(
      '/authorize/oauth/token',
      data: {
        'grant_type': "pwd",
        'username': account,
        'password': password,
        'scope': "read write",
      },
      options:
          Options(contentType: Headers.formUrlEncodedContentType, headers: {
        'Authorization': "Basic VHJhdmVsQXBwOjEyMzQ1Ng==",
      }),
    ).then((response) {
      authorization = Authorization.fromJson(response.data);
      return Authorization.fromJson(response.data);
    }).catchError((e) {
      print(e);
      throw ServerException();
    });
    return authorization;
  }

  Future<Authorization> getAuthorizedBySMSCode(
      String mobile, String code) async {
    Authorization authorization;
    await http.post(
      '/authorize/oauth/token',
      data: {
        'grant_type': "sms",
        'mobile': mobile,
        'smsCode': code,
        'smsKey': "USER_SIGN_IN",
        'scope': "read write",
      },
      options:
          Options(contentType: Headers.formUrlEncodedContentType, headers: {
        'Authorization': "Basic VHJhdmVsQXBwOjEyMzQ1Ng==",
      }),
    ).then((response) {
       authorization = Authorization.fromJson(response.data);
      return Authorization.fromJson(response.data);
    }).catchError((r) {
      print(r);
      throw ServerException();
    });
    return authorization;
  }
}
