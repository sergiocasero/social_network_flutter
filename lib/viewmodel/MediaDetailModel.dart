import 'dart:io';

import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class MediaDetailModel extends GetxController {
  final file = File("").obs;

  void onMediaLoaded(AssetEntity media) async {
    this.file.value = await media.file;
  }
}
