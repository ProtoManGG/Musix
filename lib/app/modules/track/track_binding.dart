import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:musix_final/app/data/providers/track_list_provider.dart';
import 'package:musix_final/app/data/repository/track_list_repository.dart';

import 'package:musix_final/app/modules/track/track_controller.dart';

class TrackBinding extends Bindings {
  @override
  void dependencies() {
    final Dio _dioService = Get.find();
    Get.lazyPut<TrackController>(
      () => TrackController(
        trackListRepository: TrackListRepository(
          trackListApiClient: TrackListApiClient(
            dioClient: _dioService,
          ),
        ),
      ),
    );
  }
}
