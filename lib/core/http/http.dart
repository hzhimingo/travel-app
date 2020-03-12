import 'package:dio/dio.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Http {
  final SharedPreferences sharedPreferences;

  Http({this.sharedPreferences});

  static Dio initHttpConfig() {
    Dio dio = Dio();
    dio.options.baseUrl = 'http://rap2api.taobao.org/app/mock/236828/travel/api/v1';
    dio.interceptors.add(HttpInterceptor());
    return dio;
  }
}

class HttpInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) async {
    return response;
  }

  @override
  Future onError(DioError err) {
    if (err.response != null) {
      if (err.type == DioErrorType.CONNECT_TIMEOUT) {
        Future.microtask((){
          showToast('请求超时,检查网络连接后重试');
        });
      }
      if (err.type == DioErrorType.RESPONSE) {
        if (err.response.statusCode.toString().startsWith('5')) {
          Future.microtask(() {
            showToast('服务器异常，请稍后再试');
          });
        }
      }
    } else {
      Future.microtask((){
        showToast('请检查网络连接');
      });
    }
    return super.onError(err);
  }
}

class Result {
  final int code;
  final String msg;
  final dynamic data;

  Result({
    this.code,
    this.msg,
    this.data,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      code: json['code'],
      msg: json['msg'],
      data: json['data'],
    );
  }

  @override
  String toString() {
    return 'Result: [code: $code, msg: $msg, data: $data]';
  }
}
