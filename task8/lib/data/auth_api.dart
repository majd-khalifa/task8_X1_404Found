import '../models/api_response.dart';
import '../models/user.dart';
import '../core/services/api/services.dart';
import '../core/errors/failur_request.dart';
import '../core/services/api/api_link.dart';

class AuthApi {
  final ApiService api;

  AuthApi(this.api);

  Future<ApiResponse<User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.postData(
        url: ApiLink.login,
        body: {
          'email': email,
          'password': password,
        },
      );

      return ApiResponse.fromJson(
        response,
            (data) => User.fromJson(data['user']),
      );
    } on Failure {
      rethrow;
    }
  }

  Future<ApiResponse<User>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.postData(
        url: ApiLink.register,
        body: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      return ApiResponse.fromJson(
        response,
            (data) => User.fromJson(data),
      );
    } on Failure {
      rethrow;
    }
  }
}
