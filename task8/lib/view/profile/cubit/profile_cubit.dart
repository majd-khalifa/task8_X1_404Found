import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8/core/constants/constant.dart';
import 'package:task8/core/services/api/api_link.dart';
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
      // 1️⃣ الحصول على التوكن من SharedPreferences

      final token = await _prefs.getStringValue(ConstantData.usertokenKey);

      // 2️⃣ إرسال طلب Logout للـ API إذا كان التوكن موجود
      if (token != null) {
        await ApiServices().postData(url: ApiLink.logout, token: token);
      }

      // 3️⃣ حذف كل البيانات المحلية
      await _prefs.removeAllData();

      // 4️⃣ مسح المستخدم الحالي في ApiServices
      ApiServices.currentUser = null;

      // 5️⃣ تحديث الـ state في الـ Cubit
      emit(state.copyWith(logoutSuccess: true));
    } catch (e) {
      emit(state.copyWith(error: "Logout failed"));
    }
  }
}
