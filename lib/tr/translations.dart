import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "welcome_title": "Social network",
          "welcome_subtitle":
              "The social network that doesn't collect your personal data",
          "welcome_login_button": "Log in",
          "welcome_signup_button": "Sign up",
        },
        "es_ES": {
          "welcome_title": "Social network",
          "welcome_subtitle":
              "La red social que no recopila tus datos personales",
          "welcome_login_button": "Inicio de sesión",
          "welcome_signup_button": "Registro",
        }
      };
}
