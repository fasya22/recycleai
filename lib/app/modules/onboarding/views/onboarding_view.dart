import 'package:recycleai/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/OnBoardingWidgets.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: controller.indicator,
          onPageChanged: ((value) {
            controller.page.value = value;
            print(controller.page.value);
          }),
          children: [
            // start page onboarding
            OnBoardingWidgets(
              image: 'on_boarding_1.png',
              title: 'Be a Smart People',
              subtitle:
                  'Be part of the solution, not part of the pollution',
            ),
            OnBoardingWidgets(
              image: 'on_boarding_2.png',
              title: 'Get Yourself Educated',
              subtitle:
                  'We provide informations to help you get started on your less waste journey',
            ),
            OnBoardingWidgets(
              image: 'on_boarding_3.png',
              title: 'Join Our Community',
              subtitle:
                  'recycleAi helps you to find the right way to recycle waste',
            ),
            // end
          ],
        ),
        Container(
          alignment: Alignment(0.8, -0.85),
          child: GestureDetector(
            onTap: () {
              controller.indicator.jumpToPage(3);
            },
            child: Text('Skip'),
          ),
        ),
        Obx(() => Container(
              alignment: Alignment(0, 0.85),
              child: controller.page.value != 2
                  ? SmoothPageIndicator(
                      controller: controller.indicator,
                      count: 3,
                      effect: SlideEffect(
                        activeDotColor: primaryColor,
                        spacing: 8.0,
                        radius: 4.0,
                        dotWidth: 8,
                        dotHeight: 8,
                        dotColor: Colors.grey,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      child: Container(
                        height: 55,
                        width: Get.width * 0.8,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Getting Started',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
            ))
      ],
    ));
  }
}
