import 'package:dio/dio.dart';
import 'package:loginsignup/const/api_url.dart';

class NonAuthApi {
  final Dio _dio = Dio();
  NonAuthApi() {
    _dio.options.baseUrl = AppUrl.baseUrl;
    _dio.options.sendTimeout = const Duration(seconds: 60);
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    _dio.options.followRedirects = false;
  }
  Dio get sendRequest => _dio;
}
