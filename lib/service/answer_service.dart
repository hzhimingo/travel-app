import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/answer_repository.dart';
import 'package:travel/entity/answer_cover.dart';

class AnswerService {
  final AnswerRepository repository;

  AnswerService({this.repository});

  Future<Either<Failure, List<AnswerCover>>> fetchAnswerCovers() async {
    return await repository.fetchAnswerCovers();
  }
}