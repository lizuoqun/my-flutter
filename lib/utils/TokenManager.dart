import 'package:shared_preferences/shared_preferences.dart';

import '../constant/index.dart';

class TokenManager {
  String _token = "";

  // 返回持久化对象的实例对象
  Future<SharedPreferences> _getInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> init() async {
    final prefs = await _getInstance();
    _token = prefs.getString(GlobalConstants.TOKEN_KEY) ?? "";
  }

  String getToken() {
    return _token;
  }

  Future<void> setToken(String value) async {
    final prefs = await _getInstance();
    prefs.setString(GlobalConstants.TOKEN_KEY, value);
    _token = value;
  }

  Future<void> removeToken() async {
    final prefs = await _getInstance();
    prefs.remove(GlobalConstants.TOKEN_KEY);
    _token = "";
  }
}

final tokenManager = TokenManager();
