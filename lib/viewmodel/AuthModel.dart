import 'package:get/get.dart';

class AuthModel {

  final authState = AuthState.WELCOME.obs;

  void onLoginTap() {
    authState.value = AuthState.LOGIN;
  }

  void onRegisterTap() {
    authState.value = AuthState.REGISTER;
  }
}

enum AuthState {
  WELCOME, LOGIN, REGISTER
}