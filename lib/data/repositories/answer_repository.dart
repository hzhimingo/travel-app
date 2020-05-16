import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/data/datasources/remote/answer_remote_datasource.dart';
import 'package:travel/entity/answer_cover.dart';
import 'package:travel/entity/answer_detail.dart';
import 'package:travel/entity/page.dart';

class AnswerRepository {
  final AnswerRemoteDataSource remote;

  AnswerRepository({this.remote});

  Future<Either<Failure, Page<List<AnswerCover>>>> fetchAnswerCovers(int questionId, int userId, int boundary, int offset) async {
    try {
      var data = await remote.fetchAnswerCovers(questionId, userId, boundary, offset);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, AnswerDetailData>> fetchAnswerDetail(int answerId, int userId) async {
    try {
      var data = await remote.fetchAnswerDetail(answerId, userId);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, bool>> postAnswer(int userId, String content, int question, List<MultipartFile> pics) async {
    try {
      var data = await remote.postAnswer(userId, content, question, pics);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}