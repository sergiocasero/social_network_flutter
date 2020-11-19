import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/viewmodel/AuthModel.dart';
import 'package:social_network_flutter/widget/auth/LoginWidget.dart';
import 'package:social_network_flutter/widget/auth/RegisterWidget.dart';
import 'package:social_network_flutter/widget/auth/WelcomeWidget.dart';

class AuthScreen extends StatelessWidget {
  final AuthModel _authModel = Get.put(AuthModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DI.mainColor,
      body: Obx(() {
        switch (_authModel.authState.value) {
          case AuthState.WELCOME:
            return WelcomeWidget(
              onLoginTap: () => _authModel.onLoginTap(),
              onRegisterTap: () => _authModel.onRegisterTap(),
            );
          case AuthState.LOGIN:
            return LoginWidget(
              onDoLogin: (email, pass) => _authModel.onDoLogin(email, pass),
              onRegisterTap: () => _authModel.onRegisterTap(),
              loading: _authModel.loading.value,
            );
          case AuthState.REGISTER:
            return RegisterWidget(
              loading: _authModel.loading.value,
              onLoginTap: () => _authModel.onLoginTap(),
              onDoRegister: (user) => _authModel.onDoRegister(user),
            );
          default:
            return WelcomeWidget(
              onLoginTap: () => _authModel.onLoginTap(),
              onRegisterTap: () => _authModel.onRegisterTap(),
            );
        }
      }),
    );
  }
}
