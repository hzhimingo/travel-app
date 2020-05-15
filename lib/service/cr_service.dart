import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/cr_repository.dart';

class CRService {

  final CRRepository repository;

  CRService({this.repository});

  Future<Either<Failure, bool>> addComment(int userId, int serviceBusinessId, String content) async {
    return await repository.addComment(userId, serviceBusinessId, content);
  }
}