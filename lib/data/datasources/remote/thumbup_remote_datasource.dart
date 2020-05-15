import 'dart:io';

import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';

class ThumbUpRemoteDatasource {
  final Dio http;

  ThumbUpRemoteDatasource({this.http});

  Future<bool> thumbUp(int userId, int serviceBusinessId) async {
    print('$userId 请求点赞 $serviceBusinessId');
    bool isSuccess;
    FormData formData = new FormData.fromMap({
      'userId': userId,
      'serviceBusinessId': serviceBusinessId,
    });
    await http
        .post(
      '/thumbUp/',
      data: formData,
    )
        .then((response) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        isSuccess = true;
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      print(r);
      throw ServerException();
    });
    return isSuccess;
  }

  Future<bool> cancelThumbUp(int userId, int serviceBusinessId) async {
    bool isSuccess;
    FormData formData = new FormData.fromMap({
      'userId': userId,
      'serviceBusinessId': serviceBusinessId,
    });
    await http.delete('/thumbUp/cancel', data: formData)
    .then((response) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        isSuccess = true;
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      print(r);
      throw ServerException();
    });
    return isSuccess;
  }
}
