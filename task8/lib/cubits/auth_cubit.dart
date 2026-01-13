import 'package:bloc/bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthApi authApi;
  AuthCubit(this.authApi) : super(AuthInitial());

  // login
Future<void>login(String email,String password)async{
  emit(AuthLoading());
  try{
    final response= await authApi.login(
      email:email,
      password:password
    );

    emit(AuthSuccess(response.message));

  } on Failure catch (failure){
    emit(AuthFailure(failure.errorMessage));
  }
}

  // register

  Future<void> register(
      String name,
      String email,
      String password,
      ) async {
    emit(AuthLoading());

    try {
      final response = await authApi.register(
        name: name,
        email: email,
        password: password,
      );

      emit(AuthSuccess(response.message));
    } on Failure catch (failure)  {
      emit(AuthFailure(failure.errorMessage));
    }
  }
}
