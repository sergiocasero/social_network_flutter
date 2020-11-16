import 'package:social_network_flutter/domain/model/User.dart';

abstract class Remote {
  Future<User> getUser(String token);

  Future<String> login(String id, String password);

  Future<bool> register(User user);
}