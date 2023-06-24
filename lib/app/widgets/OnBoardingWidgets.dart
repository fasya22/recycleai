import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingWidgets extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  const OnBoardingWidgets({this.image, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      child: Column(
        children: [
          Container(
            height: Get.height * 0.65,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/${image}'),
                scale: 1.75,
              ),
            ),
          ),
          Container(
            height: Get.height * 0.35,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${title}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '${subtitle}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
