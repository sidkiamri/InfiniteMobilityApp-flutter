import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static const _userKey = 'user_id';
  static const _tokenKey = 'auth_token';
  static const _expirationKey = 'token_expiration';

  Future<void> storeUserData(
      String userId, String token, DateTime expirationDate) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, userId);
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_expirationKey, expirationDate.toIso8601String());
  }

  Future<Map<String, dynamic>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(_userKey);
    final token = prefs.getString(_tokenKey);
    final expirationString = prefs.getString(_expirationKey);

    if (userId != null && token != null && expirationString != null) {
      final expirationDate = DateTime.parse(expirationString);
      return {
        'userId': userId,
        'token': token,
        'expirationDate': expirationDate
      };
    } else {
      return {}; // No stored user data
    }
  }

  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.remove(_tokenKey);
    await prefs.remove(_expirationKey);
  }
}
