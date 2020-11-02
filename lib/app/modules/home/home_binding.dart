import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:musix_final/app/data/providers/track_list_provider.dart';
import 'package:musix_final/app/data/repository/track_list_repository.dart';
import 'package:musix_final/app/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final Dio _dioService = Get.find();
    Get.lazyPut<HomeController>(
      () => HomeController(
        trackListRepository: TrackListRepository(
          trackListApiClient: TrackListApiClient(
            dioClient: _dioService,
          ),
        ),
      ),
    );
  }
}
