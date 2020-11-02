import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musix_final/app/constants/enums.dart';
import 'package:musix_final/app/modules/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeView'),
      //   centerTitle: true,
      // ),
      // body: const Center(
      //   child: Text(
      //     'HomeView is working',
      //     style: TextStyle(fontSize:20),
      //   ),
      // ),

      body: SafeArea(
        child: Obx(() {
          if (controller.currentState.value == CurrentState.initial) {
            return const Text("Initial");
          } else if (controller.currentState.value == CurrentState.loading) {
            return const Text("Loading");
          } else {
            return controller.trackListModel.fold(
              (failure) => Text(failure.toString()),
              (trackListModel) => Column(
                children: List.generate(
                  trackListModel.trackList.length,
                  (index) =>
                      Text(trackListModel.trackList[index].track.trackName),
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
