// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task8/core/errors/failur_request.dart';
import 'package:task8/core/services/api/api_link.dart';
import 'package:task8/models/user.dart';

class ApiServices {
  //---------
  static User? currentUser;

  final Dio _dio =
      Dio(
          BaseOptions(
            baseUrl: ApiLink.baseUrl,
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            sendTimeout: const Duration(seconds: 30),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              print(
                "[${options.method}][${options.uri}] headers: ${options.headers}",
              );
              handler.next(options);
            },
            onResponse: (response, handler) {
              print("${response.data}");
              handler.next(response);
            },
            onError: (error, handler) {
              print(error.message);
              handler.next(error);
            },
          ),
        );

  /// GET
  Future getData({
    required String url,
    Map<String, String>? headers,
    String? token, // هنا يمكن تمرير التوكن إذا كان مطلوب
    BuildContext? context,
  }) async {
    try {
      // دمج headers المرسلة مع التوكن إذا موجود
      final finalHeaders = {...?headers};
      if (token != null &&
          token.isNotEmpty &&
          !finalHeaders.containsKey('Authorization')) {
        finalHeaders['Authorization'] = token;
      }

      final response = await _dio.get(
        url,
        options: Options(headers: finalHeaders),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return response.data;
      } else {
        throw ServerFailure.fromResponse(response.statusCode);
      }
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  /// POST
  Future postData({
    required String url,
    Map? body,
    Map<String, String>? headers,
    String? token,
  }) async {
    try {
      final finalHeaders = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        ...?headers,
      };

      if (token != null && token.isNotEmpty) {
        finalHeaders['Authorization'] = 'Bearer $token';
      }

      final response = await _dio.post(
        url,
        data: body,
        options: Options(headers: finalHeaders),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return response.data;
      } else {
        throw ServerFailure.fromResponse(response.statusCode);
      }
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }

  /// PUT
  Future putData({
    required String url,
    Map? body,
    Map<String, String>? headers,
    String? token, // التوكن اختياري
    BuildContext? context,
  }) async {
    try {
      final finalHeaders = {...?headers};
      if (token != null &&
          token.isNotEmpty &&
          !finalHeaders.containsKey('Authorization')) {
        finalHeaders['Authorization'] = token;
      }

      final response = await _dio.put(
        url,
        data: body,
        options: Options(headers: finalHeaders),
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return response.data;
      } else {
        throw ServerFailure.fromResponse(response.statusCode);
      }
    } on DioException catch (e) {
      throw ServerFailure.fromDioError(e);
    }
  }
}
