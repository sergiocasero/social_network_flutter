import 'package:flutter/material.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/viewmodel/SplashModel.dart';

class SplashScreen extends StatelessWidget {
  final SplashModel _splashModel = SplashModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DI.mainColor,
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}
