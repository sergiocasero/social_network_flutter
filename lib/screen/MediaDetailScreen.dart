import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:social_network_flutter/viewmodel/MediaDetailModel.dart';

class MediaDetailScreen extends StatelessWidget {
  final _model = Get.put(MediaDetailModel());

  @override
  Widget build(BuildContext context) {
    _model.onMediaLoaded(Get.arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Obx(() => PhotoView(
        imageProvider: FileImage(_model.file.value),
      ),),
    );
  }
}
