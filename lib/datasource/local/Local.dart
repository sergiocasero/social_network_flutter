import 'package:social_network_flutter/domain/model/User.dart';

abstract class Local {
  Future<bool> isUserAuth();

  bool hasUser();

  Future<User> getUser();

  Future<String> getToken();

  Future<void> setToken(String token);
}
