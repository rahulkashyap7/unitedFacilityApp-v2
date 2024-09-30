import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:united_app/src/constants/image_strings.dart';
import 'package:united_app/src/constants/text_strings.dart';
import 'package:united_app/src/features/authentication/controllers/onboarding_controller.dart';
import 'package:united_app/src/features/authentication/screens/on_boarding/widgets/onboarding_dot_navigation.dart';
import 'package:united_app/src/features/authentication/screens/on_boarding/widgets/onboarding_next_button.dart';
import 'package:united_app/src/features/authentication/screens/on_boarding/widgets/onboarding_page.dart';
import 'package:united_app/src/features/authentication/screens/on_boarding/widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          //   Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: UflImages.OnBoardingImage1,
                title: UflTexts.onBoardingTitle1,
                subTitle: UflTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: UflImages.OnBoardingImage2,
                title: UflTexts.onBoardingTitle2,
                subTitle: UflTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: UflImages.OnBoardingImage3,
                title: UflTexts.onBoardingTitle3,
                subTitle: UflTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          //   Skip Button
          const OnBoardingSkip(),

          //   Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          //   Circular Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}


