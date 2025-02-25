import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:loginsignup/const/api_url.dart';
import 'package:loginsignup/routes/app_routes.dart';
import 'package:loginsignup/services/app_storage/app_storage.dart';
import 'package:loginsignup/widget/snackBar/app_snackbar.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppApi {
  final Dio _dio = Dio();

  AppApi() {
    _dio.options.baseUrl = AppUrl.baseUrl;
    _dio.options.sendTimeout = const Duration(seconds: 120);
    _dio.options.connectTimeout = const Duration(seconds: 120);
    _dio.options.receiveTimeout = const Duration(seconds: 120);
    _dio.options.followRedirects = false;

    _dio.interceptors.addAll({
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.baseUrl = AppUrl.baseUrl;
          options.contentType = 'application/json';
          options.headers["Accept"] = "application/json";

          String? token = AppAuthStorage().getToken();
          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }

          return handler.next(options); // Continue request
        },
        onError: (error, handler) async {
          log("API error occurred:");
          log("Status code: ${error.response?.statusCode}");
          log("Error message: ${error.message}");

          if (error.response?.statusCode == 401) {
            // Unauthorized error, attempt token refresh
            final newAccessToken = await reFreshNewAccessToken();

            if (newAccessToken != null) {
              // Update the request with the new token and retry
              _dio.options.headers["Authorization"] = "Bearer $newAccessToken";
              return handler.resolve(await _dio.fetch(error.requestOptions));
            } else {
              // Token refresh failed, clear storage and redirect to login
              AppSnackBar.error("Sign in again!");
              AppAuthStorage().storageClear();
              Get.offAllNamed(AppRoutes.login);
              return handler.next(error);
            }
          }

          return handler.next(error); // Continue with error
        },
      ),
      PrettyDioLogger(
        requestHeader: true,
        request: true,
        compact: true,
        error: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    });
  }

  // Token refresh logic
  Future<String?> reFreshNewAccessToken() async {
    try {
      String? refreshToken = AppAuthStorage().getRefreshToken();
      if (refreshToken != null) {
        final response = await _dio
            .post(AppUrl.token, data: {"refreshToken": refreshToken});
        String? newAccessToken = response.data["data"]["accessToken"];

        if (newAccessToken != null) {
          // Store new token
          await AppAuthStorage().setToken(newAccessToken);

          return newAccessToken;
        }
      }
    } catch (e) {
      log("Token refresh failed: $e");
      AppAuthStorage().storageClear();
      Get.offAllNamed(AppRoutes.login);
    }

    return null;
  }

  Dio get sendRequest => _dio;
}