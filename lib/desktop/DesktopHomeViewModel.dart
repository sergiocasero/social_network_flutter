import 'package:get/get.dart';
import 'package:social_network_flutter/repository/Repository.dart';

class DesktopHomeViewModel extends GetxController {
  bool _pathUI = false;

  bool get pathUI => _pathUI;

  final Repository _repository;

  DesktopHomeViewModel(this._repository);

  @override
  void onInit() {
    _checkConfig();
    super.onInit();
  }

  void _checkConfig() async {
    final path = await _repository.getPath();
    _pathUI = path == "";
    if (path != "") {
      // _repository.getMediaThumbs();
    }
  }

  void onSetPathTap(String path) async {
    print(path);
    await _repository.setPath(path);
    _checkConfig();
  }
}
