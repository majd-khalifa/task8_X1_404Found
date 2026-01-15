import 'package:task8/core/constants/constant.dart';
import 'package:task8/core/services/api/api_link.dart';
import 'package:task8/core/services/api/api_services.dart';
import 'package:task8/models/review.dart';

class ReviewApi {
  static final ApiServices _api = ApiServices();

  /// جلب كل الريفيوهات لفيلم معيّن
  static Future<List<Review>> fetchReviews(int movieId) async {
    final response = await _api.getData(url: ApiLink.movieReviews(movieId));

    if (response.isEmpty || response[0]['data'] == null) return [];

    final List list = response[0]['data'];
    return list.map((e) => Review.fromJson(e)).toList();
  }

  /// إضافة ريفيو جديد
  static Future<bool> addReview({
    required int movieId,
    required double rating,
    required String comment,
  }) async {
    final response = await _api.postData(
      url: ApiLink.addReview(movieId),
      token: ConstantData.usertoken,
      body: {"movie_id": movieId, "rating": rating, "comment": comment},
    );

    return response != null;
  }

  /// تعديل ريفيو موجود
  static Future<bool> updateReview({
    required int movieId,
    required int reviewId,
    required double rating,
    required String comment,
  }) async {
    final response = await _api.putData(
      url: ApiLink.updateReview(movieId, reviewId),
      token: ConstantData.usertoken,
      body: {"rating": rating, "comment": comment},
    );

    return response != null;
  }
}
