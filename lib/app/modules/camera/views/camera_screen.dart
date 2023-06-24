import 'dart:ffi';
import 'package:camera/camera.dart';
import 'package:recycleai/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';
import 'package:get/get.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  CameraScreen(this.cameras);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();

    if (widget.cameras == null || widget.cameras.length < 1) {
      print('Camera is not found');
    } else {
      controller = CameraController(
        widget.cameras[0],
        ResolutionPreset.high,
      );
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size screen = MediaQuery.of(context).size;
    if (controller == null || !controller.value.isInitialized) {
      return Container();
    }
    return Stack(
      children: [
        Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: CameraPreview(controller),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hasil Deteksi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: itemColor,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Push Up',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '0',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: itemColor,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Pull up',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '0',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: itemColor,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Squat',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '0',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                // Container(
                //   margin: const EdgeInsets.only(bottom: 8),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: itemColor,
                //   ),
                //   width: MediaQuery.of(context).size.width,
                //   height: 40,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text(
                //           'Biceps Curl',
                //           style: TextStyle(
                //             fontSize: 16,
                //           ),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text(
                //           '0',
                //           style: TextStyle(
                //               fontSize: 16, fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (isRecording) {
                              var file = await controller.stopVideoRecording();
                              await GallerySaver.saveVideo(file.path);
                              File(file.path).deleteSync();
                              setState(() {
                                isRecording = false;
                              });
                              Get.showSnackbar(
                                const GetSnackBar(
                                  title: "Capstone",
                                  message: 'Recording berhasil',
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                            } else {
                              controller.startVideoRecording();
                              setState(() {
                                isRecording = true;
                              });
                              Get.showSnackbar(
                                const GetSnackBar(
                                  title: "Capstone",
                                  message: 'Recording dimulai',
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          child: Text(
                            isRecording ? 'Stop Record' : 'Mulai Record',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
