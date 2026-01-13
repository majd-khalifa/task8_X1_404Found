import '../models/api_response.dart';
import '../models/user.dart';
import '../core/services/api/services.dart';

class AuthApi {
  final ApiService api;
  final SharedPreferencesService prefs;
  AuthApi(this.api,this.prefs);

  Future<ApiResponse<User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        ConstantData.login,
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.token != null) {
        await prefs.saveToken(response.token!);
      }
      return ApiResponse.fromJson(
        response,
            (data) => User.fromJson(data),
      );

    }on Failure{
      rethrow;
    }
  }

  Future<ApiResponse<User>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        ConstantData.register,
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      return ApiResponse.fromJson(
        response,
            (data) => User.fromJson(data),
      );
    }on Failure{
      rethrow;
    }
  }
}

