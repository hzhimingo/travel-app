import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/data/datasources/remote/question_remote_datasource.dart';
import 'package:travel/entity/page.dart';
import 'package:travel/entity/question_cover.dart';
import 'package:travel/entity/question_detail.dart';

class QuestionRepository {
  final QuestionRemoteDataSource remote;

  QuestionRepository({this.remote});

  Future<Either<Failure, Page<List<QuestionCover>>>> fetchQuestionCovers(int boundary, int offset) async {
     try {
      var data = await remote.fetchQuestionCovers(boundary, offset);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, QuestionDetail>> fetchQuestionDetail(int questionId) async {
     try {
      var data = await remote.fetchQuestionDetail(questionId);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, bool>> submitQuestion(int userId, String title, String content) async {
     try {
      var data = await remote.submitQuestion(userId, title, content);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}