import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/logic/service/dio_service.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await initServices();
  runApp(
    GetMaterialApp(
      title: "Musix",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
