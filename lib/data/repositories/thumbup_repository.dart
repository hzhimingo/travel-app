import 'package:dartz/dartz.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/datasources/remote/thumbup_remote_datasource.dart';

class ThumbUpRepository {

  final ThumbUpRemoteDatasource remote;

  ThumbUpRepository({this.remote});

  Future<Either<Failure, bool>> thumbUp(int userId, int serviceBusinessId) async {
    try {
      var data = await remote.thumbUp(userId, serviceBusinessId);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, bool>> cancelThumbUp(int userId, int serviceBusinessId) async {
    try {
      var data = await remote.cancelThumbUp(userId, serviceBusinessId);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}