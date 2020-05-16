import 'package:dartz/dartz.dart';
import 'package:travel/entity/simple_spot.dart';
import 'package:travel/entity/spot.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/data/datasources/remote/spot_remote_datasource.dart';

class SpotRepository {
  final SpotRemoteDataSource remote;

  SpotRepository({this.remote});

  Future<Either<Failure, List<Spot>>> fetchSpots(Map<String, dynamic> params) async {
     try {
      var data = await remote.fetchSpots(params);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<SimpleSpot>>> fetchSimpleSpots(int city) async {
     try {
      var data = await remote.fetchSimpleSpots(city);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}