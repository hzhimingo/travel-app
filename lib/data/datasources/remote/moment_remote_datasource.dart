import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/moment_cover.dart';
import 'package:travel/entity/moment_detail.dart';

class MomentRemoteDataSource {
  final Dio http;

  MomentRemoteDataSource({this.http});

  Future<List<MomentCover>> fetchMomentCovers() async {
    List<MomentCover> momentCovers;
    var response = await http.get(
      '/moment/covers',
      queryParameters: {
        'boundary': 0,
        'offset': 15,
      },
    ).then((response) {
      Result result = Result.fromJson(response.data);
      print(result);
      if (result.code == 0) {
        momentCovers = result.data["data"]
            .map<MomentCover>((item) => MomentCover.fromJson(item))
            .toList();
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      print(r);
      throw ServerException();
    });
    return momentCovers;
  }

  Future<MomentDetail> fetchMomentDetail(int id) async {
    MomentDetail momentDetail;
    await http.get(
      '/moment/$id',
    ).then((response) {
      print(response.data);
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        momentDetail = MomentDetail.fromJson(result.data);
        print(momentDetail);
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      print(r);
      throw ServerException();
    });
    return momentDetail;
  }
}
