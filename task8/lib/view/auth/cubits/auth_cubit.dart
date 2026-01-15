import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/core/constants/constant.dart';
import 'package:task8/core/errors/failur_request.dart';
import 'package:task8/core/services/api/api_link.dart';
import 'package:task8/core/services/api/api_services.dart';
import 'package:task8/core/services/services.dart';
import 'package:task8/models/user.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiServices authApi;
  final SharedPreferencesService prefs;

  AuthCubit(this.prefs, this.authApi) : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());

    try {
      final response = await authApi.postData(
        url: ApiLink.login,
        body: {'email': email, 'password': password},
      );
      print('Login response: $response'); // <-- اطبع هنا
      final token = response[0]['data']['token'];
      final userJson = response[0]["data"]['user'];
      ApiServices.currentUser = User.fromJson(userJson);
      await prefs.saveUserEmail(email);
      await prefs.saveTokenUser(token); // الآن لن يفشل
     
    print("SPLASH TOKEN: ${ConstantData.usertoken}");
    print("SPLASH EMAIL: ${ConstantData.useremail}");

      emit(const AuthSuccess(message: 'Login successfully'));
    } catch (e) {
      emit(const AuthFailure(error: 'Login failed'));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    emit(AuthLoading());

    try {
      await authApi.postData(
        url: ApiLink.register,
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation, // 👈 مهم جدًا
        },
      );

      emit(AuthSuccess(message: 'user registerd successfully'));
    } on ServerFailure catch (e) {
      emit(AuthFailure(error: e.errorMessage));
    }
  }
}
