import 'package:get/get.dart';

import '../controllers/detailmetal_controller.dart';

class DetailmetalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailmetalController>(
      () => DetailmetalController(),
    );
  }
}
