import 'package:dartz/dartz.dart';
import 'package:travel/entity/spot_filter.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/datasources/remote/spot_filter_remote_datasource.dart';

class SpotFilterRespository {
  final SpotFilterRemoteDataSource remote;

  SpotFilterRespository({this.remote});

  Future<Either<Failure, List<SpotFilter>>> fetchSpotFilters() async {
    try {
      var data = await remote.fetchSpotFilters();
      return Right(data);
    } on ApiException catch (e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
