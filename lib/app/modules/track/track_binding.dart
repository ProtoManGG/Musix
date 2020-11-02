import 'package:get/get.dart';

import 'package:musix_final/app/modules/track/track_controller.dart';

class TrackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackController>(
      () => TrackController(),
    );
  }
}
