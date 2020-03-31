import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/data/datasources/local/search_local_datasource.dart';

class SearchRepository {
  final SearchLocalDataSource local;

  SearchRepository({this.local});

  Future<Either<Failure, List<String>>> fetchSearchHistory() async {
    try {
      var data = await local.fetchSearchHistory();
      return Right(data);
    } on CacheNotExistException {
      return Left(CacheNotExistFailure());
    }
  }

  Future<Either<Failure, bool>> removeAllHistory() async {
    var data = await local.removeAllHistory();
    if (data) {
      return Right(data);
    } else {
      return Left(CacheNotExistFailure());
    }
  }

  Future<Either<Failure, List<String>>> addSearchHistory(String searchKeyWords) async {
     try {
      var data = await local.addSearchHistory(searchKeyWords);
      return Right(data);
    } on CacheSaveException {
      return Left(CacheNotExistFailure());
    }
  }
}