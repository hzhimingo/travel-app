import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/answer_cover.dart';
import 'package:travel/entity/answer_detail.dart';

class AnswerRemoteDataSource {
  final Dio http;

  AnswerRemoteDataSource({this.http});

  Future<List<AnswerCover>> fetchAnswerCovers(int questionId) async {
    List<AnswerCover> answerCovers;
    print("answerID:$questionId");
    await http.get(
      '/qa/answer/covers',
      queryParameters: {
        'boundary': 0,
        'offset': 15,
        'question': questionId,
      },
    ).then((response) {
      Result result = Result.fromJson(response.data);
      print(result);
      if (result.code == 0) {
        answerCovers = result.data["data"]
            .map<AnswerCover>((item) => AnswerCover.fromJson(item))
            .toList();
        
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      throw ServerException();
    });
    return answerCovers;
  }

  Future<AnswerDetailData> fetchAnswerDetail(int answerId) async {
    AnswerDetailData answerDetail;
    await http.get(
      '/qa/answer/$answerId',
    ).then((response) {
      Result result = Result.fromJson(response.data);
      print(result);
      if (result.code == 0) {
        answerDetail = AnswerDetailData.fromJson(result.data);
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      print(r);
      throw ServerException();
    });
    return answerDetail;
  }
}