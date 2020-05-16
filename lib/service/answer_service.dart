import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/answer_repository.dart';
import 'package:travel/entity/answer_cover.dart';
import 'package:travel/entity/answer_detail.dart';
import 'package:travel/entity/page.dart';

class AnswerService {
  final AnswerRepository repository;

  AnswerService({this.repository});

  Future<Either<Failure, Page<List<AnswerCover>>>> fetchAnswerCovers(int questionId, int userId, int boundary, int offset) async {
    return await repository.fetchAnswerCovers(questionId, userId, boundary, offset);
  }

  Future<Either<Failure, AnswerDetailData>> fetchAnswerDetail(int answerId, int userId) async {
    return await repository.fetchAnswerDetail(answerId, userId);
  }

  Future<Either<Failure, bool>> postAnswer(int userId, String content, int question, List<MultipartFile> pics) async {
    return await repository.postAnswer(userId, content, question, pics);
  }
}