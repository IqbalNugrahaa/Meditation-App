import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _token = 'user_token';
  static const String _email = 'user_email';

  // Save token & email
  static Future<void> saveSession({
    required String token,
    required String email,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_token, token);
    await prefs.setString(_email, email);
  }

  // Get Token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }

  // Get Email
  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_email);
  }

  // Has Session
  static Future<bool> hasSession() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_token);
    return token != null && token.isNotEmpty;
  }

  // Clear Session
  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_token);
    await prefs.remove(_email);
  }
}
