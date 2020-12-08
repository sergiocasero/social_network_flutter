import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/screen/PathScreen.dart';

class HomeModel extends GetxController {
  final name = "".obs;
  final assetPaths = <AssetPathEntity>[].obs;

  @override
  void onReady() {
    _getCurrentUser();
    _getPhotos();
    super.onReady();
  }

  void _getCurrentUser() async {
    final user = await DI.repository.getUser();
    name.value = user.name;
  }

  void _getPhotos() async {
    var hasPermission = await PhotoManager.requestPermission();
    if (hasPermission) {
      final items = await PhotoManager.getAssetPathList();
      assetPaths.assignAll(items);
    }
  }

  void onItemTap(AssetPathEntity item) {
    Get.to(PathScreen(), arguments: item);
  }
}
