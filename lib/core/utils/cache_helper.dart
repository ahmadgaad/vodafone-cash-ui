import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final SharedPreferences _prefs;

  CacheHelper(this._prefs);

  // Cache Keys
  static const String _balanceKey = 'cached_balance';
  static const String _serviceCardsKey = 'cached_service_cards';
  static const String _servicesKey = 'cached_services';
  static const String _promotionsKey = 'cached_promotions';

  Future<bool> saveData(String key, Map<String, dynamic> data) async {
    try {
      await _prefs.setString(key, json.encode(data));
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic>? getData(String key) {
    try {
      final dataString = _prefs.getString(key);
      if (dataString == null) return null;
      return json.decode(dataString) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  Future<bool> saveListData(String key, List<Map<String, dynamic>> data) async {
    try {
      await _prefs.setString(key, json.encode(data));
      return true;
    } catch (e) {
      return false;
    }
  }

  List<Map<String, dynamic>>? getListData(String key) {
    try {
      final dataString = _prefs.getString(key);
      if (dataString == null) return null;
      final List<dynamic> decoded = json.decode(dataString);
      return decoded.cast<Map<String, dynamic>>();
    } catch (e) {
      return null;
    }
  }

  Future<bool> clearCache(String key) async {
    try {
      await _prefs.remove(key);
      return true;
    } catch (e) {
      return false;
    }
  }

  // cache keys
  String get balanceKey => _balanceKey;
  String get serviceCardsKey => _serviceCardsKey;
  String get servicesKey => _servicesKey;
  String get promotionsKey => _promotionsKey;
}
