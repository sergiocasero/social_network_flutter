import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/widget/auth/AuthButton.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/login.svg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0, left: 24),
            child: Text(
              "welcome_back".tr,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: WaveClipperTwo(reverse: true),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 16, top: 60),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "welcome_email_field".tr,
                          icon: Icon(Icons.email),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "welcome_pass_field".tr,
                          icon: Icon(Icons.lock),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AuthButton(
                        title: "welcome_login_button".tr,
                        backgroundColor: DI.mainColor,
                        borderColor: DI.mainColor,
                        textColor: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AuthButton(
                        title: "welcome_signup_button".tr,
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.black,
                        textColor: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
