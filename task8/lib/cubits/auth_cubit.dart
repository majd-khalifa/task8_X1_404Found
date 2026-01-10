import 'package:bloc/bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // Register
  void register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    emit(AuthLoading());

    try {
      // Simulate API call
      await Future.delayed(Duration(seconds: 2));

      // Success
      emit(AuthSuccess(message: 'Account created successfully!'));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  // Login
  void login({required String email, required String password}) async {
    emit(AuthLoading());

    try {
      // Simulate API call
      await Future.delayed(Duration(seconds: 2));

      // Success
      emit(AuthSuccess(message: 'Logged in successfully!'));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }
}
