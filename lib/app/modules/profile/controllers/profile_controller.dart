import 'package:recycleai/repository/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileController extends GetxController {

  
  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  var email = "".obs;
  var name = "".obs;

  Future<void> getProfile() async {
    var repository = AuthRepository();
    var response = await repository.profile();

    if (response.item1 == 201 || response.item1 == 200) {
      email.value = response.item2.data?.email ?? '';
      name.value = response.item2.data?.name ?? '';
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
