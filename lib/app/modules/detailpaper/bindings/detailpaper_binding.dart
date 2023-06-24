import 'package:get/get.dart';

import '../controllers/detailpaper_controller.dart';

class DetailpaperBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailpaperController>(
      () => DetailpaperController(),
    );
  }
}
