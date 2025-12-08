import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefCache {
  static late SharedPreferences sharedPreferences;
  static initialSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //Add Data
  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
      return true;
    } else if (value is String) {
      await sharedPreferences.setString(key, value);
      return true;
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
      return true;
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
      return true;
    }
    return false;
  }

  //Get Data
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //Clear Data
  static void clearData({required String key}) {
    sharedPreferences.remove(key);
  }
}
