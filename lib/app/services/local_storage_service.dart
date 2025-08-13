import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LocalStorageService {
  static const _cacheKey = 'currency_cache';

  final SharedPreferences prefs;

  LocalStorageService(this.prefs);

  // Load the entire cache from SharedPreferences
  Map<String, Map<String, dynamic>> _loadCache() {
    final jsonString = prefs.getString(_cacheKey);
    if (jsonString == null) return {};
    return Map<String, Map<String, dynamic>>.from(json.decode(jsonString));
  }

  // Save the entire cache to SharedPreferences
  Future<void> _saveCache(Map<String, Map<String, dynamic>> cache) async {
    final jsonString = json.encode(cache);
    await prefs.setString(_cacheKey, jsonString);
  }

  // Get cached rate for a specific pair
  Map<String, dynamic>? getCachedRate(String from, String to) {
    final cache = _loadCache();
    final key = '$from-$to';
    return cache[key];
  }

  // Set cached rate for a specific pair
  Future<void> setCachedRate({
    required String from,
    required String to,
    required double rate,
  }) async {
    final cache = _loadCache();
    final key = '$from-$to';
    cache[key] = {'rate': rate, 'fetchedAt': DateTime.now().toIso8601String()};
    await _saveCache(cache);
  }
}
