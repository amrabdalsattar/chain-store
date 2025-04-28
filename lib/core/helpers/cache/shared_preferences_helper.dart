import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper._();

  static late SharedPreferences _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Remove a value from the SharedPreferences with given [key]
  static removeData(String key) async {
    await _prefs.remove(key);
  }

  /// Clear all data from the SharedPreferences
  static clearDataAll() async {
    await _prefs.clear();
  }

  /// Saves a [value] to the SharedPreferences with given [key]
  static setData(String key, dynamic value) async {
    switch (value.runtimeType) {
      case String:
        await _prefs.setString(key, value);
        break;
      case int:
        await _prefs.setInt(key, value);
        break;
      case double:
        await _prefs.setDouble(key, value);
        break;
      case bool:
        await _prefs.setBool(key, value);
        break;
      default:
        return null;
    }
  }

  /// Retrieves a boolean value from the SharedPreferences with given [key]
  static getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  /// Retrieves a double value from the SharedPreferences with given [key]
  static getDouble(String key) {
    return _prefs.getDouble(key) ?? 0.0;
  }

  /// Retrieves an integer value from the SharedPreferences with given [key]
  static getInt(String key) {
    return _prefs.getInt(key) ?? 0;
  }

  /// Retrieves a string value from the SharedPreferences with given [key]
  static getString(String key) {
    return _prefs.getString(key) ?? '';
  }
}
