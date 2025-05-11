import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/utils/constants.dart';
import 'package:tracking_app/core/utils/services/secure_sotrage_service.dart';

@module
abstract class DioModule {
  @Singleton()
  LogInterceptor provideLogger() {
    return LogInterceptor(requestBody: true, responseBody: true);
  }

  @Singleton()
  Dio provideDio(
    LogInterceptor logInterceptor,
    SecureStorageService secureStorageService,
  ) {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        baseUrl: Constants.baseUrl,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await secureStorageService.readSecureData(
            Constants.userToken,
          );
          log("token : $token");
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
            log("token : $token");
          }
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(logInterceptor);
    return dio;
  }

  @Singleton()
  ApiService provideApiService(Dio dio) {
    return ApiService(dio);
  }
}
