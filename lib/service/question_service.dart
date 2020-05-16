import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/question_respository.dart';
import 'package:travel/entity/page.dart';
import 'package:travel/entity/question_cover.dart';
import 'package:travel/entity/question_detail.dart';

class QuestionService {
  final QuestionRepository repository;

  QuestionService({this.repository});

  Future<Either<Failure, Page<List<QuestionCover>>>> fetchQuestionCovers(int boundary, int offset) async {
    return await repository.fetchQuestionCovers(boundary, offset);
  }

  Future<Either<Failure, QuestionDetail>> fetchQuestionDetail(int questionId) async {
    return await repository.fetchQuestionDetail(questionId);
  }

  Future<Either<Failure, bool>> submitQuestion(int userId, String title, String content) async {
    return await repository.submitQuestion(userId, title, content);
  }
}