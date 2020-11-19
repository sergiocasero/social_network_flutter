import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/screen/AuthScreen.dart';
import 'package:social_network_flutter/screen/HomeScreen.dart';

class SplashModel extends GetxController {
  @override
  void onReady() {
    _checkAuth();
    super.onReady();
  }

  void _checkAuth() async {
    final isAuth = await DI.repository.isUserAuth();

    Widget widget = AuthScreen();

    if (isAuth) {
      widget = HomeScreen();
    }

    Get.to(widget);
  }
}
