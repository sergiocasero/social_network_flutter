import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';

import 'AuthButton.dart';

class WelcomeWidget extends StatelessWidget {
  final Function() onLoginTap;
  final Function() onRegisterTap;

  const WelcomeWidget({
    Key key,
    @required this.onLoginTap,
    @required this.onRegisterTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                onTap: () => onLoginTap(),
              ),
              AuthButton(
                title: "welcome_signup_button".tr,
                backgroundColor: Colors.transparent,
                borderColor: Colors.white,
                textColor: Colors.white,
                onTap: () => onRegisterTap(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
