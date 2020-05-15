import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/question_cover.dart';
import 'package:travel/entity/question_detail.dart';

class QuestionRemoteDataSource {
  final Dio http;

  QuestionRemoteDataSource({this.http});

  Future<List<QuestionCover>> fetchQuestionCovers() async {
    List<QuestionCover> questionCovers;
    await http.get(
      '/qa/question/covers',
      queryParameters: {
        'boundary': 0,
        'offset': 10,
      }
    ).then((response) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        questionCovers = result.data["data"]
            .map<QuestionCover>((item) => QuestionCover.fromJson(item))
            .toList();
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      print(r);
       throw ServerException();
    });
    return questionCovers;
  }

  Future<QuestionDetail> fetchQuestionDetail(int questionId) async {
    print(questionId);
    QuestionDetail questionDetail;
    await http.get(
      '/qa/question/$questionId',
    ).then((response) {
      Result result = Result.fromJson(response.data);
      print(result);
      if (result.code == 0) {
        questionDetail = QuestionDetail.fromJson(result.data);
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      throw ServerException();
    });
    return questionDetail;
  }
}