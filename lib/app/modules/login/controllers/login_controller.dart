import 'package:recycleai/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../repository/auth.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  var obscureText = true.obs;
  var isLoading = false.obs;

  final getStorge = GetStorage();
  //TODO: Implement LoginController

  void toglePasswordVisibility() {
    obscureText.toggle();
  }

  void setLoading() {
    isLoading.toggle();
  }

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> login() async {
    var repository = AuthRepository();
    var response = await repository.login(email.text, password.text);

    if (response.item1 == 201 || response.item1 == 200) {
      Prefs.setString(Prefs.token, response.item2.token ?? '');
      Get.offAllNamed(Routes.DASHBOARD);
      Get.snackbar(
        "Succes",
        "Now let's workout together",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
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
