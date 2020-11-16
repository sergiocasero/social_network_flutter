import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_network_flutter/screen/SplashScreen.dart';
import 'package:social_network_flutter/tr/translations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Social network',
      translations: Messages(),
      locale: Locale("en", "US"),
      fallbackLocale: Locale("en", "US"),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
