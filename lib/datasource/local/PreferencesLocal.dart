import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_network_flutter/datasource/local/Local.dart';
import 'package:social_network_flutter/domain/model/User.dart';

class PreferencesLocal extends Local {
  static const String _AUTH_KEY = "AUTH_KEY";
  static const String _USER_KEY = "USER_KEY";

  Future<SharedPreferences> _preferences() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool> isUserAuth() async {
    final prefs = await _preferences();
    return prefs.containsKey(_AUTH_KEY)
        ? prefs.getString(_AUTH_KEY) != null && prefs.getString(_AUTH_KEY) != ""
        : false;
  }

  @override
  Future<String> getToken() async {
    final prefs = await _preferences();
    return prefs.getString(_AUTH_KEY);
  }

  @override
  Future<User> getUser() async {
    final prefs = await _preferences();
    return User.fromJson(jsonDecode(prefs.getString(_USER_KEY)));
  }

  @override
  Future<bool> hasUser() async {
    final prefs = await _preferences();
    return prefs.containsKey(_USER_KEY);
  }

  @override
  Future<void> setToken(String token) async {
    final prefs = await _preferences();
    prefs.setString(_AUTH_KEY, token);
  }

  @override
  Future<void> setUser(User user) async {
    final prefs = await _preferences();
    prefs.setString(_USER_KEY, jsonEncode(user.toJson()));
  }
}
