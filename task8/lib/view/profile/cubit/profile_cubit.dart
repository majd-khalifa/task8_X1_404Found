import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/core/services/services.dart';
import 'package:task8/core/services/api/api_services.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  final SharedPreferencesService _prefs = SharedPreferencesService();

  /// تحميل بيانات المستخدم
  Future<void> loadUser() async {
    try {
      final name = await _prefs.getStringValue("user_name") ?? "";
      final email = await _prefs.getStringValue("user_email") ?? "";

      emit(state.copyWith(name: name, email: email, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "Failed to load user data"));
    }
  }

  /// تسجيل الخروج
  Future<void> logout() async {
    try {
      await _prefs.removeAllData();
      ApiServices.currentUser = null;

      emit(state.copyWith(logoutSuccess: true));
    } catch (e) {
      emit(state.copyWith(error: "Logout failed"));
    }
  }
}
