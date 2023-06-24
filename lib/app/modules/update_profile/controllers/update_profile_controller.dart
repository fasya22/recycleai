import 'dart:async';

import 'package:recycleai/app/routes/app_pages.dart';
import 'package:recycleai/repository/auth.dart';
import 'package:recycleai/utils/prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  final email = TextEditingController();
  final name = TextEditingController();

  Future<void> doEditProfile() async {
    var repository = AuthRepository();
    var response = await repository.updateProfile(name.text, email.text);

    if (response.item1 == 201 || response.item1 == 200) {
      Get.offAllNamed(Routes.DASHBOARD);
      Get.snackbar(
        "Succes",
        "Yor're profile has been updated",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        "Error",
        "Please input your name and email correctly!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
