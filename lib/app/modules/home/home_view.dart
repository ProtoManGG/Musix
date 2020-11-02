import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        child: Obx(() {
          if (controller.currentState.value == CurrentState.initial) {
            return const Text("Initial");
          } else if (controller.currentState.value == CurrentState.loading) {
            return const Text("Loading");
          } else {
            return controller.trackListModel.fold(
                (failure) => Text(failure.toString()),
                (trackListModel) => styledTrackList(trackListModel));
          }
        }),
      ),
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

Widget styledTrackList(TrackListModel trackListModel) {
  return trackListModel.trackList
      .map((trackindex) => styledTrack(
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

Widget styledTrack({String title, String description, int trackId}) {
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
      .gestures(onTap: () => changeScreen(trackId))
      .scale(all: 1.0, animate: true)
      .animate(const Duration(milliseconds: 150), Curves.easeOut);
}

void changeScreen(int trackId) {
  Get.toNamed(
    Routes.TRACK,
    arguments: trackId,
  );
}
