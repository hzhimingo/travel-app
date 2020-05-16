import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/entity/moment_cover.dart';
import 'package:travel/data/repositories/moment_repository.dart';
import 'package:travel/entity/moment_detail.dart';
import 'package:travel/entity/page.dart';
import 'package:travel/entity/post_moment_form.dart';

class MomentService {
  final MomentRepository repository;

  MomentService({this.repository});

  Future<Either<Failure, Page<List<MomentCover>>>> fetchMomentCovers(int boundary, int offset) async {
    return await repository.fetchMomentCovers(boundary, offset);
  }

  Future<Either<Failure, MomentDetail>> fetchMomentDetail(int momentId, int userId) async {
    return await repository.fetchMomentDetail(momentId, userId);
  }

  Future<Either<Failure, bool>> addMoment(PostMomentForm form) async {
    return await repository.addMoment(form);
  }
}

//筛选参数
class MomentFilterParams extends Equatable {
  @override
  List<Object> get props => null;
}