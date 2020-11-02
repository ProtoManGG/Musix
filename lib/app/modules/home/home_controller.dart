import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:musix_final/app/constants/enums.dart';
import 'package:musix_final/app/data/models/failure_model.dart';
import 'package:musix_final/app/data/models/track_list_model.dart';
import 'package:musix_final/app/data/repository/track_list_repository.dart';

class HomeController extends GetxController {
  final TrackListRepository trackListRepository;
  HomeController({@required this.trackListRepository});

  Either<Failure, TrackListModel> trackListModel;
  final currentState = CurrentState.initial.obs;

  @override
  void onInit() {
    currentState.value = CurrentState.initial;
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    currentState.value = CurrentState.loading;
    await Task(() => trackListRepository.getTrackList())
        .attempt()
        .map((either) => either.leftMap((l) => l as Failure))
        .map(
          (either) => either.map((r) => TrackListModel.fromJson(
              r["message"]['body'] as Map<String, dynamic>)),
        )
        .run()
        .then(
      (val) {
        return trackListModel = val;
      },
    );
    currentState.value = CurrentState.loaded;
    super.onReady();
  }

  @override
  void onClose() {}
}
