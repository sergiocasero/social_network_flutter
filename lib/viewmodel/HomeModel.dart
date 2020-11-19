import 'package:get/get.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/domain/model/User.dart';

class HomeModel extends GetxController {

  final name = "".obs;

  @override
  void onReady() {
    _getCurrentUser();
    super.onReady();
  }

  void _getCurrentUser() async {
    final user = await DI.repository.getUser();
    name.value = user.name;
  }
}
