import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class BaseRepository {
  late final Dio _dio;

  BaseRepository() {
    _dio = Dio();

    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: false,
          responseHeader: false,
          responseBody: false,
          logPrint: (object) {
            if (!object.toString().contains('Response Text:')) {
              debugPrint('\x1B[36m$object\x1B[0m');
            }
          },
        ),
      );

      _dio.interceptors.add(
        InterceptorsWrapper(
          onResponse: (response, handler) {
            _printFormattedResponse(response.data);
            handler.next(response);
          },
        ),
      );
    }

    _dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  void _printFormattedResponse(dynamic data) {
    debugPrint('\x1B[32m[Response Body]\x1B[0m');
    try {
      if (data is Map || data is List) {
        final prettyJson = JsonEncoder.withIndent('  ').convert(data);
        debugPrint('\x1B[32m$prettyJson\x1B[0m');
      } else {
        debugPrint('\x1B[32m$data\x1B[0m');
      }
    } catch (e) {
      debugPrint('\x1B[31mError formatting JSON: $e\x1B[0m');
    }
    debugPrint('\x1B[32m[End of Response]\x1B[0m');
  }

  Dio get dio => _dio;
}
