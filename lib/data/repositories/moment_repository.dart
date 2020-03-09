import 'package:dartz/dartz.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/datasources/remote/moment_remote_datasource.dart';
import 'package:travel/entity/moment_cover.dart';

class MomentRepository {
  final MomentRemoteDataSource remote;

  MomentRepository({this.remote});

  Future<Either<Failure, List<MomentCover>>> fetchMomentCovers() async {
    try {
      var data = await remote.fetchMomentCovers();
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}