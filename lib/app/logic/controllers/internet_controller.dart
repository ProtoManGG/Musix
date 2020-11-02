import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class InternetController extends GetxController {
  RxBool isConnected = true.obs;
  final Connectivity connectivity;
  StreamSubscription connectivityStreamSubscription;
  InternetController({
    @required this.connectivity,
  });

  @override
  void onInit() {
    connectivityStreamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult == ConnectivityResult.none) {
          isConnected.value = false;
        } else {
          isConnected.value = true;
        }
      },
    );
    super.onInit();
  }

  @override
  void onClose() {
    connectivityStreamSubscription.cancel();
    super.onClose();
  }
}
