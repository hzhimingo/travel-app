import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/question_cover.dart';
import 'package:travel/entity/question_detail.dart';

class QuestionRemoteDataSource {
  final Dio http;

  QuestionRemoteDataSource({this.http});

  Future<List<QuestionCover>> fetchQuestionCovers() async {
    var response = await http.get(
      '/question/covers',
    );
    if (response.statusCode == 200) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        List<QuestionCover> questionCovers = result.data
            .map<QuestionCover>((item) => QuestionCover.fromJson(item))
            .toList();
        return questionCovers;
      } else {
        throw ApiException(msg: result.msg);
      }
    } else {
      throw ServerException();
    }
  }

  Future<QuestionDetail> fetchQuestionDetail(int questionId) async {
    var response = await http.get(
      '/question/detail',
      queryParameters: {
        "questionId": questionId,
      },
    );
    if (response.statusCode == 200) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        return QuestionDetail.fromJson(result.data);
      } else {
        throw ApiException(msg: result.msg);
      }
    } else {
      throw ServerException();
    }
  }
}