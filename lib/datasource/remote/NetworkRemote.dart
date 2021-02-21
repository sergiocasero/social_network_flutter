import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_uploader/flutter_uploader.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:social_network_flutter/datasource/remote/Remote.dart';
import 'package:social_network_flutter/domain/dto/UserResponse.dart';
import 'package:social_network_flutter/domain/model/Identity.dart';
import 'package:social_network_flutter/domain/model/User.dart';
import 'package:social_network_flutter/model/media_response_dto.dart';

class NetworkRemote extends Remote {
  final _ENDPOINT = !kIsWeb ? "http://192.168.0.41:24502" : "http://localhost:24502";

  final dio = Dio();

  NetworkRemote() {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  final _uploader = FlutterUploader();

  dynamic headers(String token) {
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  dynamic multipart(String token) {
    return {
      "Authorization": "Bearer $token",
    };
  }

  @override
  Future<User> getUser(String token) async {
    final response = await dio.get("$_ENDPOINT/user",
        options: Options(headers: {
          "Authorization": "Bearer $token",
        }));

    final user = UserResponse.fromJson(response.data).data;

    return user;
  }

  @override
  Future<String> login(String id, String password) async {
    final response = await dio.post(
      "$_ENDPOINT/login",
      data: jsonEncode(Identity(id: id, pass: password).toJson()),
    );

    if (response.statusCode == HttpStatus.notFound) {
      return "";
    }
    return response.data;
  }

  @override
  Future<bool> register(User user) async {
    final response = await dio.post(
      "$_ENDPOINT/register",
      data: jsonEncode(user.toJson()),
    );
    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<String> getPath(String token) async {
    final response = await dio.get("$_ENDPOINT/media/path",
        options: Options(
          headers: headers(token),
        ));
    if (response.statusCode == HttpStatus.ok) {
      final body = json.decode(response.data);
      return body["data"];
    } else {
      return "";
    }
  }

  @override
  Future<void> setPath(String path, String token) async {
    final response = await dio.post(
      "$_ENDPOINT/media/path?path=$path",
      options: Options(headers: headers(token)),
    );
  }

  @override
  Future<List<String>> getMediaIds(String token) async {
    final response = await dio.get("$_ENDPOINT/media",
        options: Options(
          headers: headers(token),
        ));

    return MediaResponseDto.fromJson(response.data).data.map((e) => e.id).toList();
  }

  @override
  Future<void> upload(String id, File file, String token) async {
    // final taskId = await _uploader.enqueue(
    //   url: "$_ENDPOINT/media",
    //   files: [
    //     FileItem(
    //       savedDir: file.absolute.path,
    //       filename: file.absolute.path.split("/").last,
    //     )
    //   ],
    //   method: UploadMethod.POST,
    //   headers: multipart(token),
    //   data: {"id": id},
    //   tag: id,
    // );

    FormData formData = FormData.fromMap({
      "id": id,
      "file": await MultipartFile.fromFile(file.absolute.path, filename: file.absolute.path.split("/").last),
    });

    await dio.post("$_ENDPOINT/media",
        data: formData, options: Options(headers: multipart(token), contentType: "multipart/form-data"));
  }
}
