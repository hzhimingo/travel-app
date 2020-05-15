import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/collect_repository.dart';

class CollectService {
  final CollectRepository repository;

  CollectService({this.repository});

  Future<Either<Failure, bool>> collect(int userId, int serviceBusinessId, int typeId) async {
    return await repository.collect(userId, serviceBusinessId, typeId);
  }

  Future<Either<Failure, bool>> cancelCollect(int userId, int serviceBusinessId) async {
    return await repository.cancelCollect(userId, serviceBusinessId);
  }
}