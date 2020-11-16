import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/model/AuthModel.dart';
import 'package:social_network_flutter/widget/auth/AuthButton.dart';

class AuthScreen extends StatelessWidget {
  final AuthModel _authModel = AuthModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DI.mainColor,
      body: Stack(
        children: [
          SvgPicture.asset(
            "assets/welcome.svg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1.5,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => _showStatus()),
                Text(
                  "welcome_title".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "welcome_subtitle".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                AuthButton(
                  title: "welcome_login_button".tr,
                  backgroundColor: Colors.white,
                  borderColor: Colors.white,
                  textColor: DI.mainColor,
                  onTap: () => _authModel.onLoginTap(),
                ),
                AuthButton(
                  title: "welcome_signup_button".tr,
                  backgroundColor: Colors.transparent,
                  borderColor: Colors.white,
                  textColor: Colors.white,
                  onTap: () => _authModel.onRegisterTap(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _showStatus() {
    switch (_authModel.authState.value) {
      case AuthState.WELCOME:
        return Text("welcome", style: TextStyle(fontSize: 50));
      case AuthState.LOGIN:
        return Text("login", style: TextStyle(fontSize: 50));
      case AuthState.REGISTER:
        return Text("register", style: TextStyle(fontSize: 50));
    }
    return Text("welcome", style: TextStyle(fontSize: 50));
  }
}
