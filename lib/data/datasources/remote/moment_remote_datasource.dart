import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/moment_cover.dart';

class MomentRemoteDataSource {
  final Dio http;

  MomentRemoteDataSource({this.http});

  Future<List<MomentCover>> fetchMomentCovers() async {
    var response = await http.get(
      '/moment/covers',
    );
    if (response.statusCode == 200) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        List<MomentCover> momentCovers = result.data['moments']
            .map<MomentCover>((item) => MomentCover.fromJson(item))
            .toList();
        return momentCovers;
      } else {
        throw ApiException(msg: result.msg);
      }
    } else {
      throw ServerException();
    }
  }
}
