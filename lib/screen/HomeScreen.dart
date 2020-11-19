import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_network_flutter/viewmodel/HomeModel.dart';

class HomeScreen extends StatelessWidget {
  final HomeModel _model = Get.put(HomeModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            _model.name.value,
          ),
        ),
      ),
    );
  }
}
