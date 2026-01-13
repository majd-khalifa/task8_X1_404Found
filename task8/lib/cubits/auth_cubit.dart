import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/core/errors/failur_request.dart';
import 'package:task8/core/services/storage/shared_preferences_service.dart';
import 'package:task8/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthApi authApi;
  final SharedPreferencesService prefs;

  AuthCubit(this.repository, this.prefs) : super(AuthInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      final token = await authApi.login(
        email: email,
        password: password,
      );

      await prefs.saveToken(token);

      emit(AuthSuccess(message: 'Login successfully'));
    } on ServerFailure catch (e) {
      emit(AuthFailure(error: e.errorMessage));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    try {
      await authApi.register(
        name: name,
        email: email,
        password: password,
      );

      emit(AuthSuccess(message: 'user registerd successfully'));
    } on ServerFailure catch (e) {
      emit(AuthFailure(error: e.errorMessage));
    }
  }
}
