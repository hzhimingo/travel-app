import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/topic_cover.dart';
import 'package:travel/entity/topic_detail.dart';

class TopicRemoteDataSource {
  final Dio http;

  TopicRemoteDataSource({this.http});

  Future<List<TopicCover>> fetchHotTopic() async {
    List<TopicCover> momentCovers;
    print("Fetch Cover");
    Dio dio = Dio();
    dio.options.baseUrl =
        'http://rap2.taobao.org:38080/app/mock/236828/travel/api/v1';
    print(dio.options.baseUrl);
    await dio.get(
      '/topic/covers',
      queryParameters: {
        'isHot': 1,
      },
    ).then((response) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        momentCovers = result.data
            .map<TopicCover>((item) => TopicCover.fromJson(item))
            .toList();
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      print(r);
      throw ServerException();
    });
    return momentCovers;
  }

  Future<List<TopicCover>> fetchTopicCovers() async {
    List<TopicCover> momentCovers;
    print("Fetch Cover");
    Dio dio = Dio();
    dio.options.baseUrl =
        'http://rap2.taobao.org:38080/app/mock/236828/travel/api/v1';
    print(dio.options.baseUrl);
    await dio.get(
      '/topic/covers',
    ).then((response) {
      Result result = Result.fromJson(response.data);
      print(result);
      if (result.code == 0) {
        momentCovers = result.data
            .map<TopicCover>((item) => TopicCover.fromJson(item))
            .toList();
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      print(r);
      throw ServerException();
    });
    return momentCovers;
  }

  Future<TopicDetail> fetchTopicDetail(int topicId) async {
    Dio dio = Dio();
    dio.options.baseUrl =
        'http://rap2.taobao.org:38080/app/mock/236828/travel/api/v1';
    var response = await dio.get('/topic/detail', queryParameters: {
      'topicId': topicId,
    });
    if (response.statusCode == 200) {
      Result result = Result.fromJson(response.data);
      print(result);
      if (result.code == 0) {
        return TopicDetail.fromJson(result.data);
      } else {
        throw ApiException(msg: result.msg);
      }
    } else {
      throw ServerException();
    }
  }
}
