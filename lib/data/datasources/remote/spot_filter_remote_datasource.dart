import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/spot_filter.dart';

class SpotFilterRemoteDataSource {
  final Dio http;

  SpotFilterRemoteDataSource({this.http});

  Future<List<SpotFilter>> fetchSpotFilters() async {
    var response = await http.get(
      '/spot/filters',
    );
    if (response.statusCode == 200) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        List<SpotFilter> spotFilters = result.data
            .map<SpotFilter>((item) => SpotFilter.fromJson(item))
            .toList();
        print(spotFilters);
        return spotFilters;
      } else {
        throw ApiException(msg: result.msg);
      }
    } else {
      throw ServerException();
    }
  }
}