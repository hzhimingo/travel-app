import 'package:dartz/dartz.dart';
import 'package:travel/core/error/failures.dart';
import 'package:travel/data/repositories/search_repository.dart';

class SearchService {
  final SearchRepository repository;

  SearchService({this.repository});

  Future<Either<Failure, List<String>>> fetchSearchHistory() async {
    return await repository.fetchSearchHistory();
  }

  Future<Either<Failure, bool>> removeAllSearchHistory() async {
    return await repository.removeAllHistory();
  }

  Future<Either<Failure, List<String>>> addSearchHistory(String searchKeyWords) async {
    return await repository.addSearchHistory(searchKeyWords);
  }
}