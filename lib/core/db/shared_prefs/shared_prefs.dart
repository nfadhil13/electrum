import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefs {
  Future<void> saveString(String key, String value);
  Future<String?> getString(String key);
  Future<void> deleteString(String key);
  Future<void> saveJson(String key, dynamic value);
  Future<Map<String, dynamic>?> getJson(String key);
}

@preResolve
@LazySingleton(as: SharedPrefs)
class SharedPrefsImpl implements SharedPrefs {
  final SharedPreferences _prefs;

  SharedPrefsImpl(this._prefs);

  @factoryMethod
  static Future<SharedPrefs> create() async {
    final prefs = await SharedPreferences.getInstance();
    return SharedPrefsImpl(prefs);
  }

  @override
  Future<void> saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  Future<String?> getString(String key) async {
    return _prefs.getString(key);
  }

  @override
  Future<void> deleteString(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> saveJson(String key, dynamic value) async {
    await saveString(key, jsonEncode(value));
  }

  @override
  Future<Map<String, dynamic>?> getJson(String key) async {
    final jsonString = await getString(key);
    if (jsonString == null) return null;
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }
}
