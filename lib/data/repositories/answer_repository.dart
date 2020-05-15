import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/data/datasources/remote/answer_remote_datasource.dart';
import 'package:travel/entity/answer_cover.dart';
import 'package:travel/entity/answer_detail.dart';

class AnswerRepository {
  final AnswerRemoteDataSource remote;

  AnswerRepository({this.remote});

  Future<Either<Failure, List<AnswerCover>>> fetchAnswerCovers(int questionId) async {
    try {
      var data = await remote.fetchAnswerCovers(questionId);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AnswerDetailData>> fetchAnswerDetail(int answerId) async {
    try {
      var data = await remote.fetchAnswerDetail(answerId);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}