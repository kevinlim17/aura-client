import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// Storage service for persistent data using SharedPreferences
class StorageService {
  static const String _keyAuthToken = 'auth_token';
  static const String _keyRefreshToken = 'refresh_token';
  static const String _keyTokenExpiry = 'token_expiry';
  static const String _keyUserData = 'user_data';
  static const String _keyAutoLogin = 'auto_login';

  final SharedPreferences _prefs;

  StorageService(this._prefs);

  /// Save authentication token
  Future<bool> saveToken(String token) async {
    return await _prefs.setString(_keyAuthToken, token);
  }

  /// Get authentication token
  String? getToken() {
    return _prefs.getString(_keyAuthToken);
  }

  /// Save refresh token
  Future<bool> saveRefreshToken(String token) async {
    return await _prefs.setString(_keyRefreshToken, token);
  }

  /// Get refresh token
  String? getRefreshToken() {
    return _prefs.getString(_keyRefreshToken);
  }

  /// Save token expiry date
  Future<bool> saveTokenExpiry(DateTime expiry) async {
    return await _prefs.setString(_keyTokenExpiry, expiry.toIso8601String());
  }

  /// Get token expiry date
  DateTime? getTokenExpiry() {
    final expiryString = _prefs.getString(_keyTokenExpiry);
    if (expiryString == null) return null;
    return DateTime.tryParse(expiryString);
  }

  /// Save user data as JSON
  Future<bool> saveUserData(Map<String, dynamic> userData) async {
    return await _prefs.setString(_keyUserData, jsonEncode(userData));
  }

  /// Get user data as JSON
  Map<String, dynamic>? getUserData() {
    final userDataString = _prefs.getString(_keyUserData);
    if (userDataString == null) return null;
    return jsonDecode(userDataString) as Map<String, dynamic>;
  }

  /// Save auto-login preference
  Future<bool> setAutoLogin(bool enabled) async {
    return await _prefs.setBool(_keyAutoLogin, enabled);
  }

  /// Get auto-login preference
  bool getAutoLogin() {
    return _prefs.getBool(_keyAutoLogin) ?? true; // Default to true
  }

  /// Check if token exists and is not expired
  bool hasValidToken() {
    final token = getToken();
    final expiry = getTokenExpiry();

    if (token == null || expiry == null) return false;
    return DateTime.now().isBefore(expiry);
  }

  /// Clear all authentication data
  Future<bool> clearAuthData() async {
    final results = await Future.wait([
      _prefs.remove(_keyAuthToken),
      _prefs.remove(_keyRefreshToken),
      _prefs.remove(_keyTokenExpiry),
      _prefs.remove(_keyUserData),
    ]);
    return results.every((result) => result);
  }

  /// Clear all data
  Future<bool> clearAll() async {
    return await _prefs.clear();
  }

  /// Get all stored keys (for debugging)
  Set<String> getAllKeys() {
    return _prefs.getKeys();
  }
}

/// Factory to create StorageService instance
class StorageServiceFactory {
  static StorageService? _instance;

  static Future<StorageService> getInstance() async {
    if (_instance != null) return _instance!;

    final prefs = await SharedPreferences.getInstance();
    _instance = StorageService(prefs);
    return _instance!;
  }

  /// Reset instance (useful for testing)
  static void reset() {
    _instance = null;
  }
}
