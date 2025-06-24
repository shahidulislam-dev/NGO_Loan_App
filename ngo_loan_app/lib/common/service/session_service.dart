import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> saveUserSession(String uid) async {
    await _prefs.setString('uid', uid);
  }

  static bool hasSession() {
    return _prefs.containsKey('uid');
  }

  static String? getUid() {
    return _prefs.getString('uid');
  }

  static Future<void> clearSession() async {
    await _prefs.remove('uid');
  }
}
