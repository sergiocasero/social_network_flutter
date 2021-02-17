import 'dart:io';

import 'package:social_network_flutter/datasource/local/Local.dart';
import 'package:social_network_flutter/datasource/remote/Remote.dart';
import 'package:social_network_flutter/domain/model/User.dart';
import 'package:social_network_flutter/model/Media.dart';
import 'package:social_network_flutter/repository/Repository.dart';

class SocialRepository extends Repository {
  final Local local;

  final Remote remote;

  SocialRepository(this.local, this.remote);

  @override
  Future<bool> isUserAuth() {
    return local.isUserAuth();
  }

  @override
  Future<User> getUser() async {
    if (await local.hasUser()) {
      return local.getUser();
    } else {
      return remote.getUser(await local.getToken());
    }
  }

  @override
  Future<bool> login(String id, String password) async {
    final token = await remote.login(id, password);
    local.setToken(token);
    return token != "";
  }

  @override
  Future<bool> register(User user) {
    return remote.register(user);
  }

  @override
  Future<String> getPath() async {
    return remote.getPath(await local.getToken());
  }

  @override
  Future<void> setPath(String path) async {
    return remote.setPath(path, await local.getToken());
  }

  @override
  Future<List<String>> getMediaIds() async {
    return remote.getMediaIds(await local.getToken());
  }

  @override
  Future<void> upload(String id, File file) async {
    return remote.upload(id, file, await local.getToken());
  }
}
