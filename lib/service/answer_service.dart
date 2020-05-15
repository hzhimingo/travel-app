import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/answer_repository.dart';
import 'package:travel/entity/answer_cover.dart';
import 'package:travel/entity/answer_detail.dart';

class AnswerService {
  final AnswerRepository repository;

  AnswerService({this.repository});

  Future<Either<Failure, List<AnswerCover>>> fetchAnswerCovers(int questionId) async {
    return await repository.fetchAnswerCovers(questionId);
  }

  Future<Either<Failure, AnswerDetailData>> fetchAnswerDetail(int answerId) async {
    print("GET ANSWER DETAIL");
    return await repository.fetchAnswerDetail(answerId);
  }
}