import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/topic_cover.dart';

class TopicRemoteDataSource {
  final Dio http;

  TopicRemoteDataSource({this.http});

  Future<List<TopicCover>> fetchHotTopic() async {
    var response = await http.get(
      '/topic/covers',
      queryParameters: {
        'isHot': 1,
      },
    );
    if (response.statusCode == 200) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        List<TopicCover> momentCovers = result.data
            .map<TopicCover>((item) => TopicCover.fromJson(item))
            .toList();
        return momentCovers;
      } else {
        throw ApiException(msg: result.msg);
      }
    } else {
      throw ServerException();
    }
  }

  Future<List<TopicCover>> fetchTopicCovers() async {
    var response = await http.get(
      '/topic/covers',
    );
    if (response.statusCode == 200) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        List<TopicCover> momentCovers = result.data
            .map<TopicCover>((item) => TopicCover.fromJson(item))
            .toList();
        return momentCovers;
      } else {
        throw ApiException(msg: result.msg);
      }
    } else {
      throw ServerException();
    }
  }
}