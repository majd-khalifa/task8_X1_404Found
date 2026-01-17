import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/core/constants/constant.dart';
import 'package:task8/core/services/api/api_link.dart';
import 'package:task8/core/services/services.dart';
import 'package:task8/core/services/api/api_services.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  final SharedPreferencesService _prefs = SharedPreferencesService();

  // load user data
  Future<void> loadUser() async {
    try {
      final name = await _prefs.getStringValue("user_name") ?? "";
      final email = await _prefs.getStringValue("user_email") ?? "";

      emit(state.copyWith(name: name, email: email, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: "Failed to load user data"));
    }
  }

  // logout user
  Future<void> logout() async {
    try {
      // get token from shared preferences

      final token = await _prefs.getStringValue(ConstantData.usertokenKey);

      // call logout API
      if (token != null) {
        await ApiServices().postData(url: ApiLink.logout, token: token);
      }

      // remove token and email from shared preferences
      await _prefs.removeAllData();

      // reset current user in ApiServices
      ApiServices.currentUser = null;

      // emit logout success state
      emit(state.copyWith(logoutSuccess: true));
    } catch (e) {
      emit(state.copyWith(error: "Logout failed"));
    }
  }
}
