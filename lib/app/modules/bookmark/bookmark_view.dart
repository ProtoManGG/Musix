import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musix_final/app/Shared/styling_widgets.dart';
import 'package:musix_final/app/constants/enums.dart';
import 'package:musix_final/app/modules/bookmark/bookmark_controller.dart';
import 'package:styled_widget/styled_widget.dart';

class BookmarkView extends GetView<BookmarkController> {
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
            child: const Text("Bookmarks ♥")
                .textAlignment(TextAlign.center)
                .fontWeight(FontWeight.bold)
                .fontSize(30.0)
                .padding(left: 16),
          ),
        ].toRow(mainAxisAlignment: MainAxisAlignment.center),
        Obx(
          () {
            if (controller.currentState.value == CurrentState.initial) {
              return CommonWidgets.buildInitial();
            } else if (controller.currentState.value == CurrentState.loading) {
              return CommonWidgets.buildLoading();
            } else if (controller.currentState.value == CurrentState.loaded) {
              return controller.widgetList.toColumn();
            } else {
              return CommonWidgets.buildInitial();
            }
          },
        ),
      ].toColumn().scrollable().padding(horizontal: 20, vertical: 30),
    ));
  }
}
