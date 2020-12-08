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
          () => Padding(
            padding: const EdgeInsets.all(1.0),
            child: GridView.builder(
              itemCount: _model.media.length,
              itemBuilder: (ctx, index) => GestureDetector(
                onTap: () => _model.onItemTap(_model.media[index]),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Image.memory(
                    _model.media[index].thumb,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            ),
          ),
        ),
      ),
    );
  }
}
