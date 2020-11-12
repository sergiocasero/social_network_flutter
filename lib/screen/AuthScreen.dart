import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/model/AuthModel.dart';

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
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Social network",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "The social network that doesn't collect your personal data",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Log in"),
                      ),
                      onPressed: () => _authModel.onLoginTap(),
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () => _authModel.onRegisterTap(),
                      color: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
