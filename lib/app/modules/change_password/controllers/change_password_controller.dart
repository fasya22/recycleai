import 'dart:async';

import 'package:recycleai/repository/auth.dart';
import 'package:recycleai/utils/prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  
  final email = TextEditingController();

  RxBool isLoadingChangePassword = false.obs;

  Future<void> doChangePassword() async {
    var repository = AuthRepository();
    var response = await repository.changePassword(email.text);

    if (response.item1 == 201 || response.item1 == 200) {
      Get.snackbar(
        "Succes",
        "Check your email to reset password",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    } else {
      Get.snackbar(
        "Error",
        "Please input your email correctly!",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
