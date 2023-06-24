import 'package:get/get.dart';

import '../controllers/detailewaste_controller.dart';

class DetailewasteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailewasteController>(
      () => DetailewasteController(),
    );
  }
}
