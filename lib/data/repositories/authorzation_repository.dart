import 'package:dartz/dartz.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/datasources/local/authorization_local_datasource.dart';
import 'package:travel/data/datasources/local/user_local_datasource.dart';
import 'package:travel/data/datasources/remote/authorzation_remote_datasource.dart';
import 'package:travel/data/datasources/remote/user_remote_datasource.dart';
import 'package:travel/entity/authorization.dart';

class AuthorizationRepository {
  final AuthorizationRemoteDataSource authorizationRemote;
  final AuthorizationLocalDataSource authorizationLocal;
  final UserRemoteDataSource userRemote;
  final UserLocalDataSource userLocal;

  AuthorizationRepository({
    this.authorizationRemote,
    this.authorizationLocal,
    this.userRemote,
    this.userLocal,
  });

  Future<Either<Failure, Authorization>> getAuthorizedByPwd(
      String account, String password) async {
    try {
      var data = await authorizationRemote.getAuthorizedByPwd(account, password);
      if (data != null) {
        //储存token信息
        authorizationLocal.storeAuthorization(data);
        //解析access_token中的信息
        //获取当前用户信息
        var user = await userRemote.getUserInfo(12341234);
        //如果不为空的话，就当前存储获取到的用户信息
        if (user != null) {
          userLocal.storeCurrentUser(user);
        }
      }
      return Right(data);
    } on ApiException catch (e) {
      //其中一项捕获了异常清除掉存储的信息
      authorizationLocal.removeAuthorized();
      userLocal.removeLocalCurrentUser();
      return Left(ApiFailure(e.msg));
    } on ServerException {
      //其中一项捕获了异常清除掉存储的信息
      authorizationLocal.removeAuthorized();
      userLocal.removeLocalCurrentUser();
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, Authorization>> getStoreAuthoried() async {
    try {
      var data = await authorizationLocal.getAuthorized();
      return Right(data);
    } on CacheNotExistException {
      return Left(CacheNotExistFailure());
    }
  }

  Future<Either<Failure, bool>> removeAuthorized() async {
    var data = await authorizationLocal.removeAuthorized();
    if (data) {
      return Right(data);
    } else {
      return Left(CacheNotExistFailure());
    }
  }

  Future<Either<Failure, bool>> hasGrantedAuthorized() async {
    var data = await authorizationLocal.hasAuthorized();
    return Right(data);
  }
}
