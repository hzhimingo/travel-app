import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';

class CollectRemoteDatasource {
  final Dio http;

  CollectRemoteDatasource({this.http});

  Future<bool> collect(int userId, int serviceBusinessId, int typeId) async {
    bool isSuccess;
    print('$userId 收藏 $serviceBusinessId');
    FormData formData = new FormData.fromMap({
      'type': typeId,
      'userId': userId,
      'serviceBusinessId': serviceBusinessId,
    });
    await http.post(
      '/collect/',
      data: formData
    ).then((response) {
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

  Future<bool> cancelCollect(int userId, int serviceBusinessId) async {
    bool isSuccess;
    print("$userId 取消收藏 $serviceBusinessId");
    FormData formData = new FormData.fromMap({
      'userId': userId,
      'serviceBusinessId': serviceBusinessId,
    });
    await http.delete(
      '/collect/',
      data: formData,
    ).then((response) {
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