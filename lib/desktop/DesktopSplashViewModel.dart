import 'package:get/get.dart';
import 'package:social_network_flutter/desktop/DesktopHomeScreen.dart';
import 'package:social_network_flutter/repository/Repository.dart';
import 'package:social_network_flutter/screen/AuthScreen.dart';

class DesktopSplashViewModel extends GetxController {
  final Repository _repository;

  DesktopSplashViewModel(this._repository);

  @override
  void onInit() {
    _checkAuth();
    super.onInit();
  }

  void _checkAuth() async {
    if (await _repository.isUserAuth()) {
      Get.offAll(() => DesktopHomeScreen());
    } else {
      Get.offAll(() => AuthScreen());
    }
  }
}
