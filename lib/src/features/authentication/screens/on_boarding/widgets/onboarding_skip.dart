import 'package:flutter/material.dart';
import 'package:united_app/src/features/authentication/controllers/onboarding_controller.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: UflDeviceUtils.getAppBarHeight(),
      right: UflSizes.defaultSpace,
      child: TextButton(onPressed: () => OnBoardingController.instance.skipPage() , child: const Text('Skip')),
    );
  }
}
