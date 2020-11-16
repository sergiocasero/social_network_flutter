import 'package:social_network_flutter/datasource/remote/Remote.dart';
import 'package:social_network_flutter/domain/model/User.dart';

class NetworkRemote extends Remote {
  @override
  Future<User> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool> login(String id, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<bool> register(User user) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
