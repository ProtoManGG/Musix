import 'package:dio/dio.dart';
import 'package:get/get.dart';

// class DioController extends GetxService {
// final _dio = Dio().obs;
// set dio(Dio value) => _dio.value = value;
// Dio get dio => _dio.value;

Future<void> initServices() async {
  await Get.putAsync(() => DioService().init());
}

class DioService extends GetxService {
  Future<Dio> init() async =>  Dio();
}
