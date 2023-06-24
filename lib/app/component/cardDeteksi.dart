import 'package:recycleai/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../routes/app_pages.dart';


class Card_Deteksi extends StatelessWidget {
  const Card_Deteksi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 20),
        child: InkWell(
          onTap: () => Get.toNamed(Routes.CAMERA),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 3.0,
                  ),
                ],
              ),
              height: 100,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_roll,
                      color: primaryColor,
                      size: 40,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Deteksi',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                        ),
                    ),
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}
