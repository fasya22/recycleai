import 'package:recycleai/model/sampah.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../repository/auth.dart';

class GraphController extends GetxController {
  @override
  void onInit() {
    getSampah();
    super.onInit();
  }

  var data = <DataSampah>[].obs;

  Future<void> getSampah() async {
    var repository = AuthRepository();
    var response = await repository.getSampah();

    if (response.item1 == 201 || response.item1 == 200) {
      data.clear();
      data.addAll(response.item2.data ?? []);
    } else {
      Get.snackbar(
        "Error",
        "Please check your email and password!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
