import 'package:dartz/dartz.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/datasources/local/authorization_local_datasource.dart';
import 'package:travel/data/datasources/remote/authorzation_remote_datasource.dart';
import 'package:travel/entity/authorization.dart';

class AuthorizationRepository {
  final AuthorizationRemoteDataSource remote;
  final AuthorizationLocalDataSource local;

  AuthorizationRepository({this.remote, this.local});

  Future<Either<Failure, Authorization>> getAuthorizedByPwd(String account, String password) async {
    try {
      var data = await remote.getAuthorizedByPwd(account, password);
      if (data != null) {
        local.storeAuthorization(data);
      }
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, Authorization>> getStoreAuthoried() async {
    try {
      var data = await local.getAuthorized();
      return Right(data);
    } on CacheNotExistException {
      return Left(CacheNotExistFailure());
    }
  }
}