import 'package:metidation_app/data/model/request/account/topic_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String _token = 'user_token';
  static const String _email = 'user_email';
  static const String _uid = 'user_uid';
  static const String _topic = 'user_topic';

  // Save token & email
  static Future<void> saveSession({
    required String token,
    required String email,
    required String uid,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_token, token);
    await prefs.setString(_email, email);
    await prefs.setString(_uid, uid);
  }

  // Save Topic
  static Future<void> saveTopic(TopicRequestModel model) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_topic, model.toJson());
  }

  // Get Token
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }

  // Get Uid
  static Future<String?> getUid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_uid);
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

  // Has Topic
  static Future<bool> hasTopic() async {
    final prefs = await SharedPreferences.getInstance();
    final topic = prefs.getString(_topic);
    return topic != null && topic.isNotEmpty;
  }

  // Clear Session
  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_token);
    await prefs.remove(_email);
    await prefs.remove(_uid);
  }
}
