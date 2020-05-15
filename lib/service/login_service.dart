import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/login_repository.dart';

class LoginService {
  final LoginRepository repository;

  LoginService({this.repository});

  Future<Either<Failure, bool>> sendLoginSMSCode(String mobile) async {
    return await repository.sendLoginSMSCode(mobile);
  }
}