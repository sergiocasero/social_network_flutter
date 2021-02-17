import 'dart:io';

import 'package:social_network_flutter/domain/model/User.dart';
import 'package:social_network_flutter/model/Media.dart';

abstract class Remote {
  Future<User> getUser(String token);

  Future<String> login(String id, String password);

  Future<bool> register(User user);

  Future<String> getPath(String token);

  Future<void> setPath(String path, String token);

  Future<List<String>> getMediaIds(String token);

  Future<void> upload(String id, File file, String token);
}
