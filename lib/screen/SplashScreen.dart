import 'package:flutter/material.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/screen/HomeScreen.dart';
import 'package:social_network_flutter/screen/LoginRegisterScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _checkAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _checkAuth() async {
    final isAuth = await DI.repository.isUserAuth();

    var route = MaterialPageRoute(builder: (ctx) => LoginRegisterScreen());

    if (isAuth) {
      route = MaterialPageRoute(builder: (ctx) => HomeScreen());
    }

    Navigator.of(context).push(route);
  }
}
