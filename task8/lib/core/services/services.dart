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


  // حذف كل البيانات
  Future<void> removeAllData() async {
    final prefs = await _prefs;
    await prefs.clear();
    removeData(ConstantData.usertoken);
    removeData(ConstantData.useremail);
 
  }
Future<void> saveTokenUser(String token) async {
  final prefs = await _prefs;
  await prefs.setString(ConstantData.usertoken, token);
}

Future<void> saveUserEmail(String email) async {
  final prefs = await _prefs;
  await prefs.setString(ConstantData.useremail, email);
}




}
