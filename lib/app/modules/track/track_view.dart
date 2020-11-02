import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musix_final/app/Shared/styling_widgets.dart';
import 'package:musix_final/app/constants/enums.dart';
import 'package:musix_final/app/modules/track/track_controller.dart';
import 'package:styled_widget/styled_widget.dart';
import '../../Shared/styling_widgets.dart';

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
          if (controller.internetController.isConnected.value) {
            if (controller.currentState.value == CurrentState.initial) {
              return CommonWidgets.buildInitial();
            } else if (controller.currentState.value == CurrentState.loading) {
              return CommonWidgets.buildLoading();
            } else if (controller.currentState.value == CurrentState.failure) {
              return CommonWidgets.buildError(controller.errorString.value);
            } else {
              return controller.track.fold(
                (failure) => Text(failure.toString()),
                (track) => [
                  CommonWidgets.styledTrackInfo(
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
          } else {
            return CommonWidgets.buildError("Internet Disconnected 😑");
          }
        }),
      ].toColumn().scrollable()),
    );
  }
}
