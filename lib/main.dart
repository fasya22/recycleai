import 'package:recycleai/theme/color.dart';
import 'package:recycleai/utils/network.dart';
import 'package:recycleai/utils/prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/camera/views/camera_view.dart';
import 'package:camera/camera.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }

  await Prefs.init();
  Network.init();
  runApp(
    GetMaterialApp(
        title: "Application",
        initialRoute: Prefs.isFirstTime()
            ? Routes.ONBOARDING
            : Prefs.getString(Prefs.token) != null
                ? Routes.DASHBOARD
                : Routes.LOGIN,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: primaryColor,
        )),
  );
}
