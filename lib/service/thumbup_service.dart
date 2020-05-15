import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/thumbup_repository.dart';

class ThumbUpService {
  final ThumbUpRepository repository;

  ThumbUpService({this.repository});

  Future<Either<Failure, bool>> thumbUp(int userId, int serviceBusinessId) async {
    return await repository.thumbUp(userId, serviceBusinessId);
  }

  Future<Either<Failure, bool>> cancelThumbUp(int userId, int serviceBusinessId) async {
    return await repository.cancelThumbUp(userId, serviceBusinessId);
  }
}