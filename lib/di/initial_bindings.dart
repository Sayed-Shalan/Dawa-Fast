import 'package:get/get.dart';
import '../base/dio/dio_client.dart';
import '../helper/auth_helper.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthHelper());
    Get.put(DioClient());
  }
}
