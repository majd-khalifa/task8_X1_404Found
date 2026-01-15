// ignore_for_file: unnecessary_this, avoid_print

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task8/core/constants/constant.dart';

class SharedPreferencesService {
  SharedPreferences? _sharedPrefences;

  // Lazy initialization
  Future<SharedPreferences> get _prefs async {
    return _sharedPrefences ??= await SharedPreferences.getInstance();
  }

  // استرجاع قيمة
  Future<String?> getStringValue(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  // حفظ قيمة
  Future<void> saveStringValue(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  // حذف مفتاح
  Future<void> removeData(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }

  // حفظ التوكن
  Future<void> saveTokenUser(String token) async {
    await saveStringValue(ConstantData.usertoken, token);
    ConstantData.usertoken = token; // تحديث المتغير العالمي فور الحفظ
  }

  // حذف كل البيانات
   Future<void> removeAllData() async {
    final prefs = await _prefs;
    await prefs.clear();
    ConstantData.usertoken = "";
    ConstantData.useremail = "";
  }

  Future<void> removeTokenUser() async {
    await removeData(ConstantData.usertoken);
    ConstantData.usertoken = "";
  }
    Future<void> saveUserEmail(String email) async {
    await saveStringValue('user_email', email);
    ConstantData.useremail = email;
  }

  Future<void> removeUserEmail() async {
    await removeData('user_email');
    ConstantData.useremail = "";
  }

 
}
