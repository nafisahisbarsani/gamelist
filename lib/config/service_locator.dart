import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:game_list_cubit/repository/game_repository.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> setUpLocator() async {
  serviceLocator.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint('REQUEST: ${options.method} ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          debugPrint('RESPONSE (${response.statusCode}):');
          try {
            final prettyJson = const JsonEncoder.withIndent(
              '  ',
            ).convert(response.data);
            debugPrint(prettyJson);
          } catch (e) {
            debugPrint('${response.data}');
          }
          debugPrint('───────────────────────────────────────────────');
          return handler.next(response);
        },
        onError: (error, handler) {
          debugPrint('ERROR: ${error.message}');
          if (error.response?.data != null) {
            debugPrint('Error Data: ${error.response?.data}');
          }
          debugPrint('───────────────────────────────────────────────');
          return handler.next(error);
        },
      ),
    );

    return dio;
  });

  serviceLocator.registerLazySingleton<GameRepository>(
    () => GameRepository(serviceLocator<Dio>()),
  );
}
