import 'package:get/get.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';

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
    final result = await DI.repository.login(email, pass);
    print(result);
    loading.value = false;
  }
}

enum AuthState { WELCOME, LOGIN, REGISTER }
