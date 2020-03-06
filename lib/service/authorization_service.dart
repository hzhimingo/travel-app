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

  Future<Either<Failure, Authorization>> getLocalAuthorized() async {
    return await repository.getStoreAuthoried();
  }
}