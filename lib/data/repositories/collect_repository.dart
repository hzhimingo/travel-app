import 'package:dartz/dartz.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/datasources/remote/collect_remote_datasource.dart';

class CollectRepository {
  final CollectRemoteDatasource remote;

  CollectRepository({this.remote});

  Future<Either<Failure, bool>> collect(int userId, int serviceBusinessId, int typeId) async {
    try {
      var data = await remote.collect(userId, serviceBusinessId, typeId);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, bool>> cancelCollect(int userId, int serviceBusinessId) async {
    try {
      var data = await remote.cancelCollect(userId, serviceBusinessId);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}