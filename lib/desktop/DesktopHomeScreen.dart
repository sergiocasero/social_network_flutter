import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_network_flutter/datasource/di/DI.dart';
import 'package:social_network_flutter/desktop/DesktopHomeViewModel.dart';

class DesktopHomeScreen extends StatelessWidget {
  String _path = "";

  final DesktopHomeViewModel _model =
      Get.put(DesktopHomeViewModel(DI.repository));

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _model.pathUI ? _pathUI() : _listUI());
  }

  Widget _pathUI() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Setup the absolute path of your drive"),
          TextFormField(
            onChanged: (value) {
              _path = value;
            },
          ),
          ElevatedButton(
              onPressed: () => _model.onSetPathTap(_path),
              child: Text("setup path")),
        ],
      ),
    );
  }

  Widget _listUI() {
    return Container();
  }
}
