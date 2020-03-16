import 'package:dartz/dartz.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/datasources/remote/topic_remote_datasource.dart';
import 'package:travel/entity/topic_cover.dart';
import 'package:travel/entity/topic_detail.dart';

class TopicRepository {
  final TopicRemoteDataSource remote;

  TopicRepository({this.remote});

  Future<Either<Failure, List<TopicCover>>> fetchHotTopic() async {
    try {
      var data = await remote.fetchHotTopic();
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<TopicCover>>> fetchTopicCovers() async {
    try {
      var data = await remote.fetchTopicCovers();
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, TopicDetail>> fetchTopicDetail(int topicId) async {
    print('call respository');
    try {
      var data = await remote.fetchTopicDetail(topicId);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}