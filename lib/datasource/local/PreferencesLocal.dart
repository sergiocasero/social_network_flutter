import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_network_flutter/datasource/local/Local.dart';

class PreferencesLocal extends Local {
  static const String _AUTH_KEY = "AUTH_KEY";

  @override
  Future<bool> isUserAuth() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(_AUTH_KEY) ? prefs.getBool(_AUTH_KEY) : false;
  }
}
