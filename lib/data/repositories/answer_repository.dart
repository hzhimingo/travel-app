import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/data/datasources/remote/answer_remote_datasource.dart';
import 'package:travel/entity/answer_cover.dart';

class AnswerRepository {
  final AnswerRemoteDataSource remote;

  AnswerRepository({this.remote});

  Future<Either<Failure, List<AnswerCover>>> fetchAnswerCovers() async {
    try {
      var data = await remote.fetchAnswerCovers();
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}