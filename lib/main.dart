import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/logic/service/dio_service.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await initServices();
  await GetStorage.init();
  final box = GetStorage();
  final favoriteTracks = await box.read("favoriteTracks");
  if (favoriteTracks == null || favoriteTracks == []) {
    await box.write("favoriteTracks", []);
  }
  runApp(
    GetMaterialApp(
      title: "Musix",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
