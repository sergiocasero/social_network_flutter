import 'package:social_network_flutter/domain/model/User.dart';

abstract class Local {
  Future<bool> isUserAuth();

  Future<bool> hasUser();

  Future<User> getUser();

  Future<void> setUser(User user);

  Future<String> getToken();

  Future<void> setToken(String token);
}
