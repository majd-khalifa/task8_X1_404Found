// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class ApiServices {
//   final Dio _dio = Dio();
//   Future getData({
//     required String url,
//     Map<String, String>? headers,
//     BuildContext? context,
//   }) async {
//     try {
//       final response = await _dio.get(url, options: Options(headers: headers));
//       if (response.statusCode == 200 ||
//           response.statusCode == 201 ||
//           response.statusCode == 204) {
//         final data = response.data;
//         return data;
//       }
//     } catch (e) {
//       if (e is DioException) {
//         final error = ServerFailure.FromDioError(e);
//         ScaffoldMessenger.of(
//           context!,
//         ).showSnackBar(SnackBar(content: Text(error.errMessage)));
//       }
//     }
//   }

//   Future postData({
//     required String url,
//     Map<String, String>? headers,
//     Map? body,
//     BuildContext? context,
//   }) async {
//     try {
//       final response = await _dio.post(url, data: body);
//       if (response.statusCode == 200) {
//         return response.data;
//       }
//     } catch (e) {
      
//     }
//   }
// }
