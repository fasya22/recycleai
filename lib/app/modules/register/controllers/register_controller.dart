import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../repository/auth.dart';
import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  

  var obscureTextPassword = true.obs;
  var obscureTextRePassword = true.obs;

  void toglePasswordVisibility() {
    obscureTextPassword.toggle();
  }

  void togleRePasswordVisibility() {
    obscureTextRePassword.toggle();
  }

  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  // final TextEditingController re_password = TextEditingController();

  Future<void> register() async {
    var repository = AuthRepository();
    var response = await repository.register(
        username.text, email.text, password.text, password.text);

    if (response.item1 == 201 || response.item1 == 200) {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        "Success, Your account created successfully",
        "Check your email to verify account",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
      );
    } else {
      Get.snackbar(
        "Error",
        response.item2.message ?? 'Something went wrong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
