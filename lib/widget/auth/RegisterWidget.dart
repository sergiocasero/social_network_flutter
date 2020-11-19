import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/widget/auth/AuthTextFormField.dart';

import 'AuthButton.dart';

class RegisterWidget extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final bool loading;
  final Function() onLoginTap;

  String _email;
  String _password;
  String _name;
  String _description;
  String _website;

  RegisterWidget({Key key, this.loading, this.onLoginTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/register.svg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 24),
            child: Text(
              "register".tr,
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
              child: Form(
                key: _formKey,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 16, top: 60),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AuthTextFormField(
                          label: "welcome_email_field".tr,
                          icon: Icons.email,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'error_email_is_mandatory'.tr;
                            } else if (!value.isEmail) {
                              return 'error_email_must_be_email'.tr;
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AuthTextFormField(
                          label: "welcome_pass_field".tr,
                          icon: Icons.lock,
                          onSaved: (value) {
                            _password = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AuthTextFormField(
                          label: "welcome_name_field".tr,
                          icon: Icons.account_box,
                          onSaved: (value) {
                            _name = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AuthTextFormField(
                          label: "welcome_description_field".tr,
                          icon: Icons.description,
                          onSaved: (value) {
                            _description = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AuthTextFormField(
                          label: "welcome_website_field".tr,
                          icon: Icons.web,
                          onSaved: (value) {
                            _website = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AuthButton(
                          title: "welcome_signup_button".tr,
                          backgroundColor: DI.mainColor,
                          borderColor: DI.mainColor,
                          textColor: Colors.white,
                          onTap: () => _onRegisterTap(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AuthButton(
                          title: "welcome_login_button".tr,
                          backgroundColor: Colors.transparent,
                          borderColor: Colors.black,
                          textColor: Colors.black,
                          onTap: () => onLoginTap(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (loading) Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  void _onRegisterTap() {}
}
