import 'package:get/get.dart';

class AuthModel {
  final authState = AuthState.WELCOME.obs;

  void onLoginTap() {
    authState.value = AuthState.LOGIN;
  }

  void onRegisterTap() {
    authState.value = AuthState.REGISTER;
  }

  void onDoLogin(String email, String pass) {
    print(email);
    print(pass);
  }
}

enum AuthState { WELCOME, LOGIN, REGISTER }
