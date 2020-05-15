import 'package:dartz/dartz.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/datasources/remote/login_remote_datasources.dart';

class LoginRepository {

  final LoginRemoteDataSource remote;

  LoginRepository({this.remote});

  Future<Either<Failure, bool>> sendLoginSMSCode(String mobile) async {
    try {
      var data = await remote.sendLoginSMSCode(mobile);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}