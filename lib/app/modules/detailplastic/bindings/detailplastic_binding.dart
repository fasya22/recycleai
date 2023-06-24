import 'package:get/get.dart';

import '../controllers/detailplastic_controller.dart';

class DetailplasticBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailplasticController>(
      () => DetailplasticController(),
    );
  }
}
