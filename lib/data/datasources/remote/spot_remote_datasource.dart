import 'package:dio/dio.dart';
import 'package:travel/entity/spot.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/core/error/exceptions.dart';


class SpotRemoteDataSource {
  final Dio http;

  SpotRemoteDataSource({this.http});

  Future<List<Spot>> fetchSpots(Map<String, dynamic> params) async {
    var response = await http.get(
      '/spot/covers',
      queryParameters: params,
    );
    if (response.statusCode == 200) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        List<Spot> spotCovers = result.data
            .map<Spot>((item) => Spot.fromJson(item))
            .toList();
        print(spotCovers);
        return spotCovers;
      } else {
        throw ApiException(msg: result.msg);
      }
    } else {
      throw ServerException();
    }
  }
}