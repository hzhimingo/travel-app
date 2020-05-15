import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/data/datasources/remote/cr_remote_datasource.dart';

class CRRepository {
  final CRRemoteDatasource remote;

  CRRepository({this.remote});

  Future<Either<Failure, bool>> addComment(int userId, int serviceBusinessId, String content) async {
    try {
      var data = await remote.addComment(userId, serviceBusinessId, content);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}