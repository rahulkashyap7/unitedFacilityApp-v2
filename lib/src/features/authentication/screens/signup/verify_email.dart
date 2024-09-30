import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:united_app/src/common_widgets/success_screen/success_screen.dart';
import 'package:united_app/src/constants/text_strings.dart';
import 'package:united_app/src/features/authentication/screens/login/login.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UflSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                  image: const AssetImage(UflImages.verifyMail),
                  width: UflHelperFunction.screenWidth() * 0.6),
              const SizedBox(height: UflSizes.spaceBtwSections),

              /// Title & Subtitle
              Text(UflTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: UflSizes.spaceBtwSections),
              Text('support@unitedfacilities.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: UflSizes.spaceBtwSections),
              Text(UflTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: UflSizes.spaceBtwSections),

              /// Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => SuccessScreen(
                        image: UflImages.verifyMail,
                        title: UflTexts.confirmEmail,
                        subTitle: UflTexts.confirmEmailSubTitle,
                        onPressed: () => Get.to(() => const LoginScreen()),
                      )),
                      child: const Text(UflTexts.uflContinue))),
              const SizedBox(height: UflSizes.spaceBtwSections),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(UflTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
