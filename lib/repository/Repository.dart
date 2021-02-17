import 'package:social_network_flutter/domain/model/User.dart';

abstract class Repository {
  Future<bool> isUserAuth();

  Future<bool> login(String id, String password);

  Future<bool> register(User user);

  Future<User> getUser();

  Future<String> getPath();

  Future<void> setPath(String path);
}
