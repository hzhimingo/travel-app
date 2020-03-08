import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/user_repository.dart';
import 'package:travel/entity/user.dart';

class UserService {
  final UserRepository userRepository;

  UserService({this.userRepository});

  Future<Either<Failure, User>> getLocalCurrentUser() async {
    return await userRepository.getLocalCurrentUser();
  }

  Future<Either<Failure, bool>> removeLocalCurrentUser() async {
    return await userRepository.removeLocalCurrentUser();
  }
}