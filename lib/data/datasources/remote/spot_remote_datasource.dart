import 'package:dio/dio.dart';
import 'package:travel/entity/simple_spot.dart';
import 'package:travel/entity/spot.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/core/error/exceptions.dart';


class SpotRemoteDataSource {
  final Dio http;

  SpotRemoteDataSource({this.http});

  Future<List<Spot>> fetchSpots(Map<String, dynamic> params) async {
    print("FETCH SPOT");
    List<Spot> spotCovers;
    Dio dio = Dio();
    dio.options.baseUrl =
        'http://rap2.taobao.org:38080/app/mock/236828/travel/api/v1';
    print(dio.options.baseUrl);
    await dio.get(
      '/spot/covers',
      queryParameters: params,
    ).then((response) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
         spotCovers = result.data
            .map<Spot>((item) => Spot.fromJson(item))
            .toList();
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      print(r);
      throw ServerException();
    });
    return spotCovers;
  }

  Future<List<SimpleSpot>> fetchSimpleSpots(int city) async {
    List<SimpleSpot> simpleSpots;
    await http.get(
      '/spot/simple',
      queryParameters: {
        'city': city
      },
    ).then((response) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        simpleSpots = result.data
            .map<SimpleSpot>((item) => SimpleSpot.fromJson(item))
            .toList();
      } else {
        throw ApiException(msg: result.msg);
    }}).catchError((r) {
      print(r);
      throw ServerException();
    });
    return simpleSpots;
  }
}