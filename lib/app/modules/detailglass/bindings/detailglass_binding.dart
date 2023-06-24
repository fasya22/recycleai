import 'package:get/get.dart';

import '../controllers/detailglass_controller.dart';

class DetailglassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailglassController>(
      () => DetailglassController(),
    );
  }
}
