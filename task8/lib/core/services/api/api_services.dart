// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:task8/core/errors/failur_request.dart';
import 'package:task8/core/helper/snack_bar_helper.dart';
import 'package:task8/core/services/api/api_link.dart';

class ApiServices {
  final Dio _dio =
      Dio(
          BaseOptions(
            baseUrl: ApiLink.baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            sendTimeout: const Duration(seconds: 10),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              print("[${options.method}][${options.uri}]");
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
  Future getData({
    required String url,
    Map<String, String>? headers,
    BuildContext? context,
  }) async {
    try {
      final response = await _dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        final data = response.data;
        return data;
        
      }else {
        throw ServerFailure.fromResponse(response.statusCode);
      }
      
    } catch (errors) {
      if (errors is DioException) {
        final error = ServerFailure.fromDioError(errors);
        SnackBarHelper.showError(context!, error.errorMessage);
      }
    }
  }

  Future postData({
    required String url,
    Map<String, String>? headers,
    Map? body,
    BuildContext? context,
  }) async {
    try {
      final response = await _dio.post(url, data: body);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        final data = response.data;
        return data;
      }else {
        throw ServerFailure.fromResponse(response.statusCode);
      }
    } catch (errors) {
      if (errors is DioException) {
        final error = ServerFailure.fromDioError(errors);
        SnackBarHelper.showError(context!, error.errorMessage);
      }
    }
  }

  Future putData({
    required String url,
    Map<String, String>? headers,
    Map? body,
    BuildContext? context,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: body,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        return response.data;
      }else {
        throw ServerFailure.fromResponse(response.statusCode);
      }
    } catch (errors) {
      if (errors is DioException) {
        final error = ServerFailure.fromDioError(errors);
        SnackBarHelper.showError(context!, error.errorMessage);
      }
    }
  }
}
