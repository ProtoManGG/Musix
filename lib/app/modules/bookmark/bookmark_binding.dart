import 'package:get/get.dart';

import 'package:musix_final/app/modules/bookmark/bookmark_controller.dart';

class BookmarkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookmarkController>(
      () => BookmarkController(),
    );
  }
}
