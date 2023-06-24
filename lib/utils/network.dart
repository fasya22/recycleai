import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Network {
  static late Dio dio;

  static init() {
    dio = Dio();
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate=
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    if (kReleaseMode) {
      dio.options.baseUrl = "https://bawdy-notebook-production.up.railway.app/";
    } else {
      dio.options.baseUrl = "https://bawdy-notebook-production.up.railway.app/";
    }
    dio.options.responseType = ResponseType.json;
    dio.options.headers = {
      "content-type": "application/json",
    };
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }
}
