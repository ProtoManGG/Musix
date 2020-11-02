import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:musix_final/app/constants/enums.dart';
import 'package:musix_final/app/data/models/failure_model.dart';
import 'package:musix_final/app/data/models/track_lyrics_model.dart';
import 'package:musix_final/app/data/models/track_model.dart';
import 'package:musix_final/app/data/repository/track_list_repository.dart';
import 'package:musix_final/app/logic/controllers/internet_controller.dart';

class TrackController extends GetxController {
  InternetController internetController =
      Get.put(InternetController(connectivity: Connectivity()));
  final TrackListRepository trackListRepository;
  final currentState = CurrentState.initial.obs;
  Either<Failure, Track> track;
  TrackLyricsModel trackLyricsModel;
  RxBool isFavorite = false.obs;
  GetStorage box;
  RxString errorString = "".obs;

  int trackId = Get.arguments as int;

  TrackController({@required this.trackListRepository});

  @override
  void onInit() {
    box = GetStorage();
    currentState.value = CurrentState.initial;
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    currentState.value = CurrentState.loading;
    await Task(() => trackListRepository.getTrack(trackId: trackId))
        .attempt()
        .map((either) => either.leftMap((l) => l as Failure))
        .map(
          (either) => either.map((r) => Track.fromJson(
              r["message"]['body']["track"] as Map<String, dynamic>)),
        )
        .run()
        .then(
      (val) {
        return track = val;
      },
    );

    try {
      await trackListRepository.getTrackLyrics(trackId: trackId).then(
        (response) {
          if (response["message"]["header"]["status_code"] == 200) {
            trackLyricsModel = TrackLyricsModel.fromJson(
                response["message"]["body"]["lyrics"] as Map<String, dynamic>);
          }
        },
      );
    } on Failure catch (f) {
      errorString.value = f.message;
      currentState.value = CurrentState.failure;
      rethrow;
    }
    final favoriteTracks = await box.read("favoriteTracks");

    for (final trackJson in favoriteTracks) {
      if (trackJson["trackId"] == trackId) {
        isFavorite.value = true;
      }
    }
    currentState.value = CurrentState.loaded;
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> makeFavorite({
    @required Track itrack,
    @required bool isFavoriteSong,
  }) async {
    if (isFavoriteSong) {
      final favoriteTracks = await box.read("favoriteTracks");
      favoriteTracks.add(
        {
          "trackId": itrack.trackId,
          "trackName": itrack.trackName,
        },
      );
      await box.write("favoriteTracks", favoriteTracks);
    } else {
      final List favoriteTracks = await box.read("favoriteTracks");
      // for (final track in favoriteTracks) {
      //   if (track["trackId"] == track.trackId) {
      //     isFavorite.value = isFavoriteSong;
      //     favoriteTracks.remove(track);
      //   }
      // }
      favoriteTracks.removeWhere((track) {
        return track["trackId"] == itrack.trackId;
      });
      await box.write("favoriteTracks", favoriteTracks);
    }
    isFavorite.value = isFavoriteSong;
  }
}
