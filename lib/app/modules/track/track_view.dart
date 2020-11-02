import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musix_final/app/Shared/styling_widgets.dart';
import 'package:musix_final/app/constants/enums.dart';
import 'package:musix_final/app/data/models/track_lyrics_model.dart';
import 'package:musix_final/app/data/models/track_model.dart';
import 'package:musix_final/app/modules/track/track_controller.dart';
import 'package:styled_widget/styled_widget.dart';

class TrackView extends GetView<TrackController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: [
        [
          Expanded(
            child: IconButton(
              icon: const Icon(Icons.arrow_back).alignment(Alignment.center),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          Expanded(
            flex: 8,
            child: const Text("Track Information 🎸")
                .textAlignment(TextAlign.center)
                .fontWeight(FontWeight.bold)
                .fontSize(30.0)
                .padding(left: 16),
          ),
        ].toRow(mainAxisAlignment: MainAxisAlignment.center),
        Obx(() {
          if (controller.currentState.value == CurrentState.initial) {
            return CommonWidgets.buildInitial();
          } else if (controller.currentState.value == CurrentState.loading) {
            return CommonWidgets.buildLoading();
          } else {
            return controller.track.fold(
              (failure) => Text(failure.toString()),
              (track) => [
                styledTrackInfo(
                  track: track,
                  trackLyricsModel: controller.trackLyricsModel,
                ),
                FloatingActionButton(
                  onPressed: () {
                    controller.makeFavorite(
                      itrack: track,
                      isFavoriteSong: !controller.isFavorite.value,
                    );
                  },
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite,
                    color: controller.isFavorite.value
                        ? Colors.redAccent
                        : Colors.black,
                  ),
                )
              ].toColumn().scrollable(),
            );
          }
        }),
      ].toColumn().scrollable()),
    );
  }
}

Widget styledTrackInfo({
  @required Track track,
  @required TrackLyricsModel trackLyricsModel,
}) {
  return <Widget>[
    StyledWidgets.styledTextForLabel("Name"),
    StyledWidgets.styledContainer(track.trackName),
    StyledWidgets.styledTextForLabel("Artist"),
    StyledWidgets.styledContainer(track.artistName),
    StyledWidgets.styledTextForLabel("Album Name"),
    StyledWidgets.styledContainer(track.albumName),
    StyledWidgets.styledTextForLabel("Explicit"),
    StyledWidgets.styledContainer(track.explicit == 1 ? "Yes" : "No"),
    StyledWidgets.styledTextForLabel("Ratings"),
    StyledWidgets.styledContainer(track.trackRating.toString()),
    StyledWidgets.styledTextForLabel("Lyrics"),
    StyledWidgets.styledContainer(trackLyricsModel?.lyricsBody ?? "")
  ]
      .toColumn()
      .scrollable()
      .padding(vertical: 30, horizontal: 20)
      .constrained(minHeight: Get.height - (2 * 30));
}

class StyledWidgets {
  static Widget styledTextForLabel(String text) => Text(text)
      .bold()
      .italic()
      .fontSize(25.0)
      .alignment(Alignment.centerLeft)
      .padding(left: 5, top: 8);

  static Widget styledContainer(String text) => Container(
          child:
              Text(text).textColor(Colors.white).fontSize(16).padding(all: 12))
      .decorated(
        color: Colors.redAccent.shade200,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      )
      .alignment(Alignment.centerLeft);
}
