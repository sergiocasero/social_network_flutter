import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:social_network_flutter/datasource/remote/Remote.dart';
import 'package:social_network_flutter/domain/dto/UserResponse.dart';
import 'package:social_network_flutter/domain/model/Identity.dart';
import 'package:social_network_flutter/domain/model/User.dart';

class NetworkRemote extends Remote {
  final _ENDPOINT = !kIsWeb ? "http://192.168.0.17:24502" : "http://localhost:24502";

  dynamic headers(String token) {
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

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
    final response = await http.post(
      "$_ENDPOINT/login",
      body: jsonEncode(Identity(id: id, pass: password).toJson()),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == HttpStatus.notFound) {
      return "";
    }
    return response.body;
  }

  @override
  Future<bool> register(User user) async {
    final response = await http.post(
      "$_ENDPOINT/register",
      body: jsonEncode(user.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<String> getPath(String token) async {
    final response = await http.get(
      "$_ENDPOINT/media/path",
      headers: headers(token),
    );
    if (response.statusCode == HttpStatus.ok) {
      final body = json.decode(response.body);
      return body.path;
    } else {
      return "";
    }
  }

  @override
  Future<void> setPath(String path, String token) async {
    print(token);
    final response = await http.post(
      "$_ENDPOINT/media/path?path=$path",
      headers: headers(token),
    );
    print(response.statusCode);
  }
}
