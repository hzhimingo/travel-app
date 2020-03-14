import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/answer_cover.dart';

class AnswerRemoteDataSource {
  final Dio http;

  AnswerRemoteDataSource({this.http});

  Future<List<AnswerCover>> fetchAnswerCovers() async {
    var response = await http.get(
      '/answer/covers',
    );
    if (response.statusCode == 200) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        List<AnswerCover> answerCovers = result.data
            .map<AnswerCover>((item) => AnswerCover.fromJson(item))
            .toList();
        return answerCovers;
      } else {
        throw ApiException(msg: result.msg);
      }
    } else {
      throw ServerException();
    }
  }
}