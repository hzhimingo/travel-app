import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:travel/core/error/exceptions.dart';
import 'package:travel/core/http/http.dart';
import 'package:travel/entity/moment_cover.dart';
import 'package:travel/entity/moment_detail.dart';
import 'package:travel/entity/page.dart';
import 'package:travel/entity/post_moment_form.dart';

class MomentRemoteDataSource {
  final Dio http;

  MomentRemoteDataSource({this.http});

  Future<Page<List<MomentCover>>> fetchMomentCovers(int boundary, int offset) async {
    Page<List<MomentCover>> page;
    await http.get(
      '/moment/covers',
      queryParameters: {
        'boundary': boundary,
        'offset': offset,
      },
    ).then((response) {
      Result result = Result.fromJson(response.data);
      if (result.code == 0) {
        List<MomentCover> momentCovers = result.data["data"]
            .map<MomentCover>((item) => MomentCover.fromJson(item))
            .toList();
          page = Page(
          boundary: result.data['boundary'],
          offset: result.data['offset'],
          data: momentCovers,
          hasNext: result.data['hasNext'],
        );
         print("${page.boundary} ${page.offset} ${page.hasNext} ${page.data.length}");
      } else {
        throw ApiException(msg: result.msg);
      }
    }).catchError((r) {
      print(r);
      throw ServerException();
    });
    return page;
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
