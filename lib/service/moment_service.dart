import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/entity/moment_cover.dart';
import 'package:travel/data/repositories/moment_repository.dart';
import 'package:travel/entity/moment_detail.dart';

class MomentService {
  final MomentRepository repository;

  MomentService({this.repository});

  Future<Either<Failure, List<MomentCover>>> fetchMomentCovers() async {
    return await repository.fetchMomentCovers();
  }

  Future<Either<Failure, MomentDetail>> fetchMomentDetail(int id) async {
    return await repository.fetchMomentDetail(id);
  }
}

//筛选参数
class MomentFilterParams extends Equatable {
  @override
  List<Object> get props => null;
}