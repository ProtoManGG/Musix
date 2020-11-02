import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musix_final/app/constants/enums.dart';
import 'package:musix_final/app/modules/bookmark/bookmark_controller.dart';
import 'package:styled_widget/styled_widget.dart';

class BookmarkView extends GetView<BookmarkController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.currentState.value == CurrentState.initial) {
            return const Text("Initial");
          } else if (controller.currentState.value == CurrentState.loading) {
            return const Text("Loading");
          } else if (controller.currentState.value == CurrentState.loaded) {
            return controller.widgetList.toColumn();
          } else {
            return const Text("Initial");
          }
        },
      ),
    );
  }
}
