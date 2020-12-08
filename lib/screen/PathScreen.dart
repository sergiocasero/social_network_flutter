import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_network_flutter/viewmodel/PathModel.dart';

class PathScreen extends StatelessWidget {
  final _model = Get.put(PathModel());

  @override
  Widget build(BuildContext context) {
    _model.onPathLoaded(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(_model.name.value)),
      ),
      body: Obx(
        () => GridView.builder(
          itemCount: _model.media.length,
          itemBuilder: (ctx, index) => GestureDetector(
            onTap: () => _model.onAssetTap(_model.media[index].id),
            child: Image.memory(
              _model.media[index].thumb,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        ),
      ),
    );
  }
}
