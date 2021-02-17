import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_network_flutter/model/MediaRange.dart';
import 'package:social_network_flutter/viewmodel/HomeModel.dart';

class HomeScreen extends StatelessWidget {
  final HomeModel _model = Get.put(HomeModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => ListView.builder(
          itemCount: _model.media.length,
          itemBuilder: (ctx, index) => _day(_model.media[index]),
        ),
      ),
    );
  }

  Widget _day(Day day) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(day.label),
          Container(
            child: GridView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: day.child.length,
              itemBuilder: (ctx, index) => GestureDetector(
                onTap: () => _model.onItemTap(day.child[index]),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Image.memory(
                    day.child[index].thumb,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            ),
          ),
        ],
      ),
    );
  }
}
