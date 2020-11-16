import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_network_flutter/datasource/remote/Remote.dart';
import 'package:social_network_flutter/domain/dto/UserResponse.dart';
import 'package:social_network_flutter/domain/model/User.dart';

class NetworkRemote extends Remote {
  static const _ENDPOINT = "https://prebetasocialnetwork.herokuapp.com";

  @override
  Future<User> getUser(String token) async {
    final response = await http.get("$_ENDPOINT/user", headers: {
      "Authorization": "Bearer $token",
    });

    final user = UserResponse.fromJson(jsonDecode(response.body)).data;

    return user;
  }

  @override
  Future<String> login(String id, String password) async {
    final response =
        await http.post("$_ENDPOINT/login", body: {"id": id, "pass": password});

    return response.body;
  }

  @override
  Future<bool> register(User user) async {
    try {
      await http.post("$_ENDPOINT/register", body: user.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
