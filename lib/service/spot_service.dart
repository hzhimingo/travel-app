import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/spot_filter_repository.dart';
import 'package:travel/data/repositories/spot_repository.dart';
import 'package:travel/entity/spot.dart';

class SpotService {
  final SpotRepository spotRepo;
  final SpotFilterRespository filterRepo;

  SpotService({this.spotRepo, this.filterRepo});

  Future<Either<Failure, List<dynamic>>> fetchSpotFilterAndList() async {
    var data = await filterRepo.fetchSpotFilters();
    return data.fold(
      (failure) => Left(ServerFailure()),
      (spotFilters) async {
        var listData = await fetchSpots({'city': 123123});
        return listData.fold(
          (failure) => Left(ServerFailure()),
          (spots) => Right([spotFilters, spots]),
        );
      },
    );
  }

  Future<Either<Failure, List<Spot>>> fetchSpots(Map<String, dynamic> params) async {
    return await spotRepo.fetchSpots(params);
  }
}