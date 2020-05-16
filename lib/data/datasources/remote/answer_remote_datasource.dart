import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/answer_cover.dart';
import 'package:travel/entity/answer_detail.dart';
import 'package:travel/entity/page.dart';

class AnswerRemoteDataSource {
  final Dio http;

  AnswerRemoteDataSource({this.http});

  Future<Page<List<AnswerCover>>> fetchAnswerCovers(int questionId, int userId, int boundary, int offset) async {
    Page<List<AnswerCover>> page;
    var headers;
    if (userId != null) {
      headers = {
        'userId': userId,
      };
    }
    await http.get(
      '/qa/answer/covers',
      queryParameters: {
        'boundary': boundary,
        'offset': offset,
        'question': questionId,
      },
      options: Options(
        headers: headers,
      ),
    ).then((response) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        List<AnswerCover> answerCovers = result.data["data"]
            .map<AnswerCover>((item) => AnswerCover.fromJson(item))
            .toList();
        page = Page(
          boundary: result.data['boundary'],
          offset: result.data['offset'],
          data: answerCovers,
          hasNext: result.data['hasNext'],
        );
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      throw ServerException();
    });
    return page;
  }

  Future<List<AnswerCover>> fetchHotAnswerCovers(int questionId, int userId) {

  }

  Future<AnswerDetailData> fetchAnswerDetail(int answerId, int userId) async {
    AnswerDetailData answerDetail;
    var headers;
    if (userId != null) {
      headers = {
        'userId': userId,
      };
    }
    await http.get(
      '/qa/answer/$answerId',
      options: Options(
        headers: headers,
      ),
    ).then((response) {
      Result result = Result.fromJson(response.data);
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

  Future<bool> postAnswer(int userId, String content, int question, List<MultipartFile> pics) async {
    bool isSuccess;
    print("$userId 回答 $question 内容 $content");
    FormData formData = FormData.fromMap({
      'userId': userId,
      'content': content,
      'questionId': question,
      'pics': pics,
    });
    await http.post(
      '/qa/answer/',
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