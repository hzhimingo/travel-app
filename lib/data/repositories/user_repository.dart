import 'package:dartz/dartz.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/datasources/local/user_local_datasource.dart';
import 'package:travel/entity/user.dart';

class UserRepository {
  final UserLocalDataSource userLocal;

  UserRepository({this.userLocal});

  Future<Either<Failure, User>> getLocalCurrentUser() async {
    try {
      var data = await userLocal.getLocalCurrentUser();
      if (data != null) {
        return Right(data);
      } else {
        return Left(CacheNotExistFailure());
      }
    } on CacheNotExistException {
      return Left(CacheNotExistFailure());
    }
  }

  Future<Either<Failure, bool>> removeLocalCurrentUser() async {
    var data = await userLocal.removeLocalCurrentUser();
    if (data) {
      return Right(data);
    } else {
      return Left(CacheNotExistFailure());
    }
  }
}
