import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DoiHelper {
  static Dio dio;

  static intit() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );

    return 'Connected Successfully';
  }

  static Future<Response> getdata({
    @required String url,
    @required Map<String, dynamic> query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
