import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/question_respository.dart';
import 'package:travel/entity/question_cover.dart';
import 'package:travel/entity/question_detail.dart';

class QuestionService {
  final QuestionRepository repository;

  QuestionService({this.repository});

  Future<Either<Failure, List<QuestionCover>>> fetchQuestionCovers() async {
    return await repository.fetchQuestionCovers();
  }

  Future<Either<Failure, QuestionDetail>> fetchQuestionDetail(int questionId) async {
    return await repository.fetchQuestionDetail(questionId);
  }
}