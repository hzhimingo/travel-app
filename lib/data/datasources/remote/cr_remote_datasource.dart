import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';

class CRRemoteDatasource {
  final Dio http;

  CRRemoteDatasource({this.http});

  Future<bool> addComment(int userId, int serviceBusinessId, String content) async {
    print("$userId 评论了 $serviceBusinessId 内容：$content");
    FormData formData = new FormData.fromMap({
      'content': content,
      'userId': userId,
      'serviceBusinessId': serviceBusinessId,
    });
    var response = await http.post(
      '/cr/comment',
      data: formData,
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

  Future<bool> addReply(int userId, int serviceBusinessId, String content) async {
    print("$userId 评论了 $serviceBusinessId 内容：$content");
    FormData formData = new FormData.fromMap({
      'content': content,
      'userId': userId,
      'serviceBusinessId': serviceBusinessId,
    });
    var response = await http.post(
      '/cr/comment',
      data: formData,
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

  Future<bool> fetchComment(int userId, int serviceBusinessId, String content) async {
    print("$userId 评论了 $serviceBusinessId 内容：$content");
    FormData formData = new FormData.fromMap({
      'content': content,
      'userId': userId,
      'serviceBusinessId': serviceBusinessId,
    });
    var response = await http.post(
      '/cr/comment',
      data: formData,
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

  Future<bool> fetchReply(int userId, int serviceBusinessId, String content) async {
    print("$userId 评论了 $serviceBusinessId 内容：$content");
    FormData formData = new FormData.fromMap({
      'content': content,
      'userId': userId,
      'serviceBusinessId': serviceBusinessId,
    });
    var response = await http.post(
      '/cr/comment',
      data: formData,
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