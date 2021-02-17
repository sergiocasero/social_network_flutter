import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/desktop/DesktopHomeScreen.dart';
import 'package:social_network_flutter/domain/model/User.dart';
import 'package:social_network_flutter/screen/HomeScreen.dart';

class AuthModel extends GetxController {
  final authState = AuthState.WELCOME.obs;

  final loading = false.obs;

  void onLoginTap() {
    authState.value = AuthState.LOGIN;
  }

  void onRegisterTap() {
    authState.value = AuthState.REGISTER;
  }

  void onDoLogin(String email, String pass) async {
    loading.value = true;
    final loginSuccess = await DI.repository.login(email, pass.encrypt());
    if (loginSuccess) {
      if (!kIsWeb) {
        Get.offAll(HomeScreen());
      } else {
        Get.offAll(DesktopHomeScreen());
      }
    } else {
      Get.snackbar(
        "login_error_title".tr,
        "login_error_message".tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    loading.value = false;
  }

  void onDoRegister(User user) async {
    loading.value = true;
    await DI.repository.register(user);
    authState.value = AuthState.LOGIN;
    loading.value = false;
  }
}

enum AuthState { WELCOME, LOGIN, REGISTER }
