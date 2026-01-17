// ignore_for_file: unnecessary_this, avoid_print

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task8/core/constants/constant.dart';

class SharedPreferencesService {
  SharedPreferences? _sharedPrefences;

  // Lazy initialization
  Future<SharedPreferences> get _prefs async {
    return _sharedPrefences ??= await SharedPreferences.getInstance();
  }

  //get value
  Future<String?> getStringValue(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  // save value
  Future<void> saveStringValue(String key, String value) async {
    final prefs = await _prefs;
    await prefs.setString(key, value);
  }

  // remove value
  Future<void> removeData(String key) async {
    final prefs = await _prefs;
    await prefs.remove(key);
  }

  // save token
  Future<void> saveTokenUser(String token) async {
    await saveStringValue(ConstantData.usertokenKey, token);
    ConstantData.usertoken = token;
  }

  Future<void> saveUserEmail(String email) async {
    await saveStringValue(ConstantData.useremailKey, email);
    ConstantData.useremail = email;
  }

  // remove all data
  Future<void> removeAllData() async {
    final prefs = await _prefs;
    await prefs.clear();
    removeData(ConstantData.usertoken);
    removeData(ConstantData.useremail);
  }
}
