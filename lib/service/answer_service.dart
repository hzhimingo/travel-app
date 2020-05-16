import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/answer_repository.dart';
import 'package:travel/entity/answer_cover.dart';
import 'package:travel/entity/answer_detail.dart';

class AnswerService {
  final AnswerRepository repository;

  AnswerService({this.repository});

  Future<Either<Failure, List<AnswerCover>>> fetchAnswerCovers(int questionId, int userId) async {
    return await repository.fetchAnswerCovers(questionId, userId);
  }

  Future<Either<Failure, AnswerDetailData>> fetchAnswerDetail(int answerId, int userId) async {
    return await repository.fetchAnswerDetail(answerId, userId);
  }

  Future<Either<Failure, bool>> postAnswer(int userId, String content, int question, List<MultipartFile> pics) async {
    return await repository.postAnswer(userId, content, question, pics);
  }
}