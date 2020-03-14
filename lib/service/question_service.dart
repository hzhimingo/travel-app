import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/question_respository.dart';
import 'package:travel/entity/question_cover.dart';

class QuestionService {
  final QuestionRepository repository;

  QuestionService({this.repository});

  Future<Either<Failure, List<QuestionCover>>> fetchQuestionCovers() async {
    return await repository.fetchQuestionCovers();
  }
}