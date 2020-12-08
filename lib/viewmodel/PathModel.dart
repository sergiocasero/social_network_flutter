
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:social_network_flutter/model/Media.dart';
import 'package:social_network_flutter/screen/MediaDetailScreen.dart';

class PathModel extends GetxController {
  final media = <Media>[].obs;
  final name = "".obs;
  final assets = <AssetEntity>[];

  void onPathLoaded(arguments) async {
    this.media.clear();
    final path = Get.arguments;
    if (path is AssetPathEntity) {
      final assets = await path.getAssetListRange(start: 0, end: path.assetCount);
      this.name.value = path.name;
      final media = <Media>[];
      for (final asset in assets) {
        media.add(Media(id: asset.id, thumb: await asset.thumbData));
      }
      this.media.assignAll(media);
      this.assets.addAll(assets);
    }
  }

  void onAssetTap(String id) {
    final asset = this.assets.firstWhere((element) => element.id == id);
    Get.to(MediaDetailScreen(), arguments: asset);
  }
}
