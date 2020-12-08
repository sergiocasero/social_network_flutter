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
          () => ListView.builder(
            itemCount: _model.assetPaths.length,
            itemBuilder: (ctx, index) {
              final item = _model.assetPaths[index];
              return GestureDetector(
                onTap: () => _model.onItemTap(item),
                child: Card(
                  child: ListTile(
                    title: Text(item.name),
                    trailing: Text(item.assetCount.toString()),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
