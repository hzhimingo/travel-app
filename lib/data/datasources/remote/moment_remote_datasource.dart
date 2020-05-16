import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/moment_cover.dart';
import 'package:travel/entity/moment_detail.dart';
import 'package:travel/entity/post_moment_form.dart';

class MomentRemoteDataSource {
  final Dio http;

  MomentRemoteDataSource({this.http});

  Future<List<MomentCover>> fetchMomentCovers() async {
    List<MomentCover> momentCovers;
    await http.get(
      '/moment/covers',
      queryParameters: {
        'boundary': 0,
        'offset': 15,
      },
    ).then((response) {
      Result result = Result.fromJson(response.data);
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

  Future<MomentDetail> fetchMomentDetail(int momentId, int userId) async {
    MomentDetail momentDetail;
    var headers;
    if (userId != null) {
      headers = {
        'userId': userId,
      };
    }
    await http.get(
      '/moment/$momentId',
      options: Options(
        headers: headers,
      )
    ).then((response) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        momentDetail = MomentDetail.fromJson(result.data);
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      print(r);
      throw ServerException();
    });
    return momentDetail;
  }

  Future<bool> addMoment(PostMomentForm form) async {
    bool isSuccess;
    print("${form.userId} ${form.title} ${form.content} ${form.spot} ${form.pictures.length}");
    FormData formData = FormData.fromMap({
      'userId': form.userId,
      'title': form.title,
      'content': form.content,
      'pics': form.pictures,
      'spot': form.spot,
    });
    await http.post(
      '/moment/',
      data: formData
    ).then((response) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        isSuccess = true;
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      print(r);
      throw ServerException();
    });
    return isSuccess;
  }
}
