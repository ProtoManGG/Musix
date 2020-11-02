import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:musix_final/app/data/providers/track_list_provider.dart';
import 'package:musix_final/app/data/repository/track_list_repository.dart';

import 'package:musix_final/app/modules/bookmark/bookmark_controller.dart';

class BookmarkBinding extends Bindings {
  final Dio _dioService = Get.find();

  @override
  void dependencies() {
    Get.lazyPut<BookmarkController>(
      () => BookmarkController(
        trackListRepository: TrackListRepository(
          trackListApiClient: TrackListApiClient(dioClient: _dioService),
        ),
      ),
    );
  }
}
