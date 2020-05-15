import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';

class LoginRemoteDataSource {

  final Dio http;

  LoginRemoteDataSource({this.http});

  Future<bool> sendLoginSMSCode(String mobile) async {
    var response = await http.post(
      '/sms/',
      data: {
        "telephone": mobile,
        "digit": 6,
        "smsKey": "USER_SIGN_IN"
      }
    );
    if (response.statusCode == 200) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        return true;
      } else {
        throw ApiException(msg: result.msg);
      }
    } else {
      throw ServerException();
    }
  }
}