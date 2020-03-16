import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/topic_repository.dart';
import 'package:travel/entity/topic_cover.dart';
import 'package:travel/entity/topic_detail.dart';

class TopicService {
  final TopicRepository repository;

  TopicService({this.repository});

  Future<Either<Failure, List<TopicCover>>> fetchHotTopic() async {
    return await repository.fetchHotTopic();
  }

  Future<Either<Failure, List<TopicCover>>> fetchTopicCovers() async {
    return await repository.fetchHotTopic();
  }

  Future<Either<Failure, TopicDetail>> fetchTopicDetail(int topicId) async {
    print('call service');
    return await repository.fetchTopicDetail(topicId);
  }
}