import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/screen/HomeScreen.dart';
import 'package:social_network_flutter/screen/LoginRegisterScreen.dart';

class SplashModel {
  SplashModel() {
    _checkAuth();
  }

  void _checkAuth() async {
    final isAuth = await DI.repository.isUserAuth();

    Widget widget = LoginRegisterScreen();

    if (isAuth) {
      widget = HomeScreen();
    }

    Get.to(widget);
  }
}
