import 'package:flutter/material.dart';
import 'package:united_app/src/common_widgets/style/spacing_styles.dart';
import 'package:united_app/src/constants/image_strings.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import '../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: UflSpacingStyle.paddingWidthAppBarHeight * 2,
          child: Column(
            children: [
              Image(
                  image: const AssetImage(UflImages.verifiedMail),
                  width: UflHelperFunction.screenWidth() * 0.6),
              const SizedBox(height: UflSizes.spaceBtwSections),

              /// Title & Subtitle
              Text(UflTexts.yourAccountCreatedTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: UflSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: onPressed,
                      child: const Text(UflTexts.uflContinue))),
            ],
          ),
        ),
      ),
    );
  }
}
