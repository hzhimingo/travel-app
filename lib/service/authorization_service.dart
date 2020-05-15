import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/authorzation_repository.dart';
import 'package:travel/entity/authorization.dart';

class AuthorizationService {
  final AuthorizationRepository repository;

  AuthorizationService({this.repository});

  Future<Either<Failure, Authorization>> getAuthorizedByPwd(String account, String password) async {
    return await repository.getAuthorizedByPwd(account, password);
  }

  Future<Either<Failure, Authorization>> getAuthorizedBySMSCode(String mobile, String code) async {
    return await repository.getAuthorizedBySMSCode(mobile, code);
  }

  Future<Either<Failure, Authorization>> getLocalAuthorized() async {
    return await repository.getStoreAuthoried();
  }

  Future<Either<Failure, bool>> hasGrantedAuthorized() async {
    return await repository.hasGrantedAuthorized();
  }

  Future<Either<Failure, bool>> removeAuthorized() async {
    return await repository.removeAuthorized();
  }
}