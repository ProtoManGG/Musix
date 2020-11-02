import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musix_final/app/Shared/styling_widgets.dart';
import 'package:musix_final/app/constants/enums.dart';
import 'package:musix_final/app/data/models/track_list_model.dart';
import 'package:musix_final/app/modules/home/home_controller.dart';
import 'package:musix_final/app/routes/app_pages.dart';
import 'package:styled_widget/styled_widget.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: [
        const Text('Trending Songs')
            .fontWeight(FontWeight.bold)
            .fontSize(32.0)
            .alignment(Alignment.center)
            .padding(top: 40),
        Obx(() {
          if (controller.internetController.isConnected.value) {
            if (controller.currentState.value == CurrentState.initial) {
              return CommonWidgets.buildInitial();
            } else if (controller.currentState.value == CurrentState.loading) {
              return CommonWidgets.buildLoading();
            } else {
              return controller.trackListModel.fold(
                (failure) => Text(failure.toString()),
                (trackListModel) => styledTrackList(
                  trackListModel: trackListModel,
                  isInternetActive:
                      controller.internetController.isConnected.value,
                ),
              );
            }
          } else {
            return CommonWidgets.buildError("Internet Disconnected 😑");
          }
        }),
      ].toColumn().scrollable()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.BOOKMARK);
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.bookmark, color: Colors.redAccent).iconSize(30),
      ),
    );
  }
}

Widget styledTrackList(
    {TrackListModel trackListModel, @required bool isInternetActive}) {
  return trackListModel.trackList
      .map((trackindex) => styledTrack(
            isInternetActive: isInternetActive,
            title: trackindex.track.trackName,
            description: trackindex.track.albumName,
            trackId: trackindex.track.trackId,
          ))
      .toList()
      .toColumn()
      .scrollable()
      .padding(vertical: 30, horizontal: 20)
      .alignment(Alignment.center)
      .constrained(minHeight: Get.height - (2 * 30));
}

Widget styledTrack(
    {String title,
    String description,
    int trackId,
    @required bool isInternetActive}) {
  return <Widget>[
    const Icon(Icons.library_music_rounded, size: 20, color: Colors.white)
        .padding(all: 12)
        .decorated(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(30),
        )
        .padding(left: 15, right: 10),
    <Widget>[
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ).padding(bottom: 5),
      Text(
        description,
        style: const TextStyle(
          color: Colors.black26,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    ].toColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
    ),
  ]
      .toRow()
      .alignment(Alignment.center)
      .borderRadius(all: 15)
      .ripple()
      .backgroundColor(Colors.white, animate: true)
      .clipRRect(all: 25) // clip ripple
      .borderRadius(all: 25, animate: true)
      .elevation(
        20,
        borderRadius: BorderRadius.circular(25),
        shadowColor: const Color(0x30000000),
      )
      .constrained(height: 80)
      .padding(vertical: 12)
      .gestures(onTap: () => isInternetActive ? changeScreen(trackId) : null)
      .scale(all: 1.0, animate: true)
      .animate(const Duration(milliseconds: 150), Curves.easeOut);
}

void changeScreen(int trackId) {
  Get.toNamed(
    Routes.TRACK,
    arguments: trackId,
  );
}
