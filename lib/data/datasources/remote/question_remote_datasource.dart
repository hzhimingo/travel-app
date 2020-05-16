import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/page.dart';
import 'package:travel/entity/question_cover.dart';
import 'package:travel/entity/question_detail.dart';

class QuestionRemoteDataSource {
  final Dio http;

  QuestionRemoteDataSource({this.http});

  Future<Page<List<QuestionCover>>> fetchQuestionCovers(int boundary, int offset) async {
    Page<List<QuestionCover>> page;
    await http.get(
      '/qa/question/covers',
      queryParameters: {
        'boundary': boundary,
        'offset': offset,
      }
    ).then((response) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        List<QuestionCover> questionCovers = result.data["data"]
            .map<QuestionCover>((item) => QuestionCover.fromJson(item))
            .toList();
        page = Page(
          boundary: result.data['boundary'],
          offset: result.data['offset'],
          data: questionCovers,
          hasNext: result.data['hasNext'],
        );
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      print(r);
       throw ServerException();
    });
    return page;
  }

  Future<QuestionDetail> fetchQuestionDetail(int questionId) async {
    print(questionId);
    QuestionDetail questionDetail;
    await http.get(
      '/qa/question/$questionId',
    ).then((response) {
      Result result = Result.fromJson(response.data);
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

  Future<bool> submitQuestion(int userId, String title, String content) async {
    bool isSuccess;
    print("$userId 发布问题 $title");
    FormData formData = FormData.fromMap({
      "userId": userId,
      "title": title,
      "content": content
    });
    await http.post(
      '/qa/question/',
      data: formData
    ).then((response) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        isSuccess = true;
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      throw ServerException();
    });
    return isSuccess;
  }
}