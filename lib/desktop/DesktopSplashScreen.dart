import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/desktop/DesktopSplashViewModel.dart';

class DesktopSplashScreen extends StatelessWidget {
  final DesktopSplashViewModel _model =
  Get.put(DesktopSplashViewModel(DI.repository));

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
