import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/entity/moment_cover.dart';
import 'package:travel/entity/moment_detail.dart';
import 'package:travel/data/datasources/remote/moment_remote_datasource.dart';
import 'package:travel/entity/page.dart';
import 'package:travel/entity/post_moment_form.dart';

class MomentRepository {
  final MomentRemoteDataSource remote;

  MomentRepository({this.remote});

  Future<Either<Failure, Page<List<MomentCover>>>> fetchMomentCovers(int boundary, int offset) async {
    try {
      var data = await remote.fetchMomentCovers(boundary, offset);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, MomentDetail>> fetchMomentDetail(int momentId, int userId) async {
    try {
      var data = await remote.fetchMomentDetail(momentId, userId);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, bool>> addMoment(PostMomentForm form) async {
    try {
      var data = await remote.addMoment(form);
      return Right(data);
    } on ApiException catch(e) {
      return Left(ApiFailure(e.msg));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}