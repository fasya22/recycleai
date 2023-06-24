import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/camera_controller.dart';
import 'camera_screen.dart';

late List<CameraDescription> cameras;

class CameraView extends GetView<CamerasController> {
  const CameraView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CameraScreen(cameras),
    );
  }
}