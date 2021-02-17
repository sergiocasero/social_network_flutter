import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/model/Media.dart';
import 'package:social_network_flutter/model/MediaRange.dart';

class HomeModel extends GetxController {
  final name = "".obs;
  final media = <Day>[].obs;

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
        assets.addAll(
            await path.getAssetListRange(start: 0, end: path.assetCount));
      }
      assets.sort((a1, a2) =>
          a2.createDateTime.millisecondsSinceEpoch -
          a1.createDateTime.millisecondsSinceEpoch);

      final days = Map<int, List<Media>>();

      var previousDay = 0;
      print(assets.length);
      for (final asset in assets) {
        final media = Media(
          id: asset.id,
          thumb: await asset.thumbDataWithSize(100, 100),
        );
        final day = getDayInMillis(asset.createDateTime);
        if (days.containsKey(day)) {
          days[day].add(media);
        } else {
          days[day] = [media];
          if (previousDay != 0) {
            this.media.add(Day(
                  DateFormat("dd/MM/yyyy")
                      .format(DateTime.fromMillisecondsSinceEpoch(previousDay)),
                  days[previousDay],
                ));
          }
          previousDay = day;
        }
      }
    }
  }

  int getDayInMillis(DateTime dateTime) {
    return dateTime
        .subtract(Duration(
            hours: dateTime.hour,
            minutes: dateTime.minute,
            seconds: dateTime.second))
        .millisecondsSinceEpoch;
  }

  void onItemTap(Media item) {
    // Get.to(PathScreen(), arguments: item);
  }
}
