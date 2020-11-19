import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_network_flutter/datasource/local/PreferencesLocal.dart';
import 'package:social_network_flutter/datasource/remote/NetworkRemote.dart';
import 'package:social_network_flutter/repository/Repository.dart';
import 'package:social_network_flutter/repository/SocialRepository.dart';

class DI {
  static Repository repository = SocialRepository(
    PreferencesLocal(),
    NetworkRemote(),
  );

  static Color mainColor = Color.fromRGBO(0, 107, 255, 1);
  static String password = "p@ssw0rd";
}

extension StringsExtensions on String {
  String encrypt() {
    final key = utf8.encode(DI.password);
    final bytes = utf8.encode(this);

    final hmacSha256 = Hmac(sha256, key);
    final digest = hmacSha256.convert(bytes);

    return digest.toString();
  }
}
