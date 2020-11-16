import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_network_flutter/datasource/local/Local.dart';
import 'package:social_network_flutter/domain/model/User.dart';

class PreferencesLocal extends Local {
  static const String _AUTH_KEY = "AUTH_KEY";

  @override
  Future<bool> isUserAuth() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(_AUTH_KEY) ? prefs.getBool(_AUTH_KEY) : false;
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<User> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  bool hasUser() {
    // TODO: implement hasUser
    throw UnimplementedError();
  }

  @override
  Future<void> setToken(String token) {
    // TODO: implement setToken
    throw UnimplementedError();
  }
}
