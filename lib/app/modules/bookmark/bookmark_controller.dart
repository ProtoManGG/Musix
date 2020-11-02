import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:musix_final/app/constants/enums.dart';
import 'package:musix_final/app/data/repository/track_list_repository.dart';
import 'package:musix_final/app/logic/controllers/internet_controller.dart';
import 'package:musix_final/app/modules/home/home_view.dart';

class BookmarkController extends GetxController {
  InternetController internetController =
      Get.put(InternetController(connectivity: Connectivity()));
  final TrackListRepository trackListRepository;

  GetStorage box;
  final currentState = CurrentState.initial.obs;

  BookmarkController({@required this.trackListRepository});
  List<Widget> widgetList = [];

  @override
  void onInit() {
    box = GetStorage();
    currentState.value = CurrentState.initial;
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    currentState.value = CurrentState.loading;
    final List favoriteTracks = await box.read("favoriteTracks");

    for (final track in favoriteTracks) {
      widgetList.add(
        styledTrack(
          trackId: track["trackId"] as int,
          title: track["trackName"] as String,
          description: track["trackId"].toString(),
          isInternetActive: internetController.isConnected.value,
        ),
      );
    }
    currentState.value = CurrentState.loaded;
    super.onReady();
  }

  @override
  void onClose() {}
}
