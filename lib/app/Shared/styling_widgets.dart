import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musix_final/app/data/models/track_lyrics_model.dart';
import 'package:musix_final/app/data/models/track_model.dart';
import 'package:styled_widget/styled_widget.dart';

class CommonWidgets {
  static Widget buildInitial() {
    return Card(
      color: Colors.blueAccent,
      child: const Text("It's Lonely in Here").padding(all: 20),
    );
  }

  static Widget buildLoading() {
    return const Text("Loading...")
        .bold()
        .fontSize(25)
        .textColor(Colors.white)
        .textAlignment(TextAlign.center)
        .padding(all: 16)
        .card(color: Colors.redAccent);
  }

  static Widget buildError(String message) {
    return Text(message)
        .bold()
        .fontSize(25)
        .textColor(Colors.white)
        .textAlignment(TextAlign.center)
        .padding(all: 16)
        .card(color: Colors.redAccent);
  }

  static Widget styledTrackInfo({
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
