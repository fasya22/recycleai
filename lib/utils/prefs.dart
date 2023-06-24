import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;

  // keys
  static String token = "token";
  static String firstTime = "first_time";

  // inits
  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  // sets
  static Future<bool> setString(String key, String value) async =>
      await _prefs.setString(key, value);

  static Future<bool> setBool(String key, bool value) async =>
      await _prefs.setBool(key, value);

  static Future<bool> remove(String key) async => await _prefs.remove(key);

  static String? getString(String key) => _prefs.getString(key);

  static bool isFirstTime() => _prefs.getBool(firstTime) ?? true;

  static Future<bool> deleteToken() async => await _prefs.remove(token);
}
