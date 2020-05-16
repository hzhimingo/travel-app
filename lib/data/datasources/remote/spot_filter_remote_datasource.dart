import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/spot_filter.dart';

class SpotFilterRemoteDataSource {
  final Dio http;

  SpotFilterRemoteDataSource({this.http});

  Future<List<SpotFilter>> fetchSpotFilters() async {
     Dio dio = Dio();
    dio.options.baseUrl =
        'http://rap2.taobao.org:38080/app/mock/236828/travel/api/v1';
    print(dio.options.baseUrl);
    var response = await dio.get(
      '/spot/filters',
    );
    if (response.statusCode == 200) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        List<SpotFilter> spotFilters = result.data
            .map<SpotFilter>((item) => SpotFilter.fromJson(item))
            .toList();
        return spotFilters;
      } else {
        throw ApiException(msg: result.msg);
      }
    } else {
      throw ServerException();
    }
  }
}