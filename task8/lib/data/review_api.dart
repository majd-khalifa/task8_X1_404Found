import 'package:http/http.dart' as http;
import 'package:task8/core/constants/constant.dart';
import 'dart:convert';
import 'package:task8/models/review.dart';
import 'package:task8/core/services/api/api_link.dart';

class ReviewApi {
  /// جلب كل الريفيوهات لفيلم معيّن
  static Future<List<Review>> fetchReviews(int movieId) async {
    final url = Uri.parse(ApiLink.movieReviews(movieId));
    final response = await http.get(
      url,
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode != 200) return [];

    final body = jsonDecode(response.body);
    final list = body[0]["data"] as List;

    return list.map((e) => Review.fromJson(e)).toList();
  }

  /// إضافة ريفيو جديد
  static Future<bool> addReview({
    required int movieId,
    required double rating,
    required String comment,
  }) async {
    final url = Uri.parse(ApiLink.addReview(movieId));
    final token = ConstantData.usertoken;

    final response = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "movie_id": movieId,
        "rating": rating,
        "comment": comment,
      }),
    );

    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body}");

    return response.statusCode >= 200 && response.statusCode < 300;
  }

  /// تعديل ريفيو موجود
  static Future<bool> updateReview({
    required int movieId,
    required int reviewId,
    required double rating,
    required String comment,
  }) async {
    final url = Uri.parse(ApiLink.updateReview(movieId, reviewId));
    final token = ConstantData.usertoken;

    final response = await http.put(
      url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"rating": rating, "comment": comment}),
    );

    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body}");

    return response.statusCode >= 200 && response.statusCode < 300;
  }
}
