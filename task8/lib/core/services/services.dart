// ignore_for_file: unnecessary_this, avoid_print

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task8/core/constants/constant.dart';
import 'package:task8/core/constants/pref_key.dart';
class ApiService{
  final Dio dio;
  ApiService(this.dio);
  Future<dynamic> post(
      String path, {
        Map<String, dynamic>? data,
      })async{
    try {
      final response = await dio.post(
        path,
        data: data,
        options: Options(
          headers: {
            'Accept': 'application/json',
          },
        ),
      );
      return response.data;
    }on DioException catch(e){
      throw ServerFailure.fromDioError(e);
    }
  }
}
class SharedPreferencesService {
  late SharedPreferences _sharedPrefences;

  Future init() async {
    _sharedPrefences = await SharedPreferences.getInstance();
    if (await this.getStringValue(PrefKey.token) != null) {
      ConstantData.usertoken = (await this.getStringValue(PrefKey.token))!;
      print(ConstantData.usertoken);
    }
  }

  Future<void> saveStringValue(String key, String value) async {
    await _sharedPrefences.setString(key, value);
  }

  Future<String?> getStringValue(String key) async {
    return _sharedPrefences.getString(key);
  }

  Future<void> removeData(String key) async {
    await _sharedPrefences.remove(key);
  }

  Future saveTokenUser(String token) async {
    await saveStringValue(PrefKey.token, token);
  }

  Future<void> removeAllData() async {
    await _sharedPrefences.clear();
  }
}
