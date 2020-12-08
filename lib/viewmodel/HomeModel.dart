import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/viewmodel/PathModel.dart';

class HomeModel extends GetxController {
  final name = "".obs;
  final media = <Media>[].obs;

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
      final assets = <AssetEntity>[];
      for (final path in items) {
        assets.addAll(await path.getAssetListRange(start: 0, end: path.assetCount));
      }
      assets.sort((a1, a2) => a2.createDateTime.millisecondsSinceEpoch - a1.createDateTime.millisecondsSinceEpoch);

      for (final asset in assets) {
        this.media.add(Media(id: asset.id, thumb: await asset.thumbDataWithSize(100, 100)));
      }
    }
  }

  void onItemTap(Media item) {
    // Get.to(PathScreen(), arguments: item);
  }
}
