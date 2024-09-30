import 'package:flutter/material.dart';

import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class UflLoginHeader extends StatelessWidget {
  const UflLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 85,
          image: AssetImage(dark
              ? UflImages.lightLoginLogo
              : UflImages.darkLoginLogo),
        ),
        Text(UflTexts.loginTitle1,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: UflSizes.sm),
        Text.rich(
          TextSpan(
            text: UflTexts.loginTitle2, // The main text in #EAA040 color
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: const Color(0xFFEAA040), // Apply #EAA040 color
            ),
            children: [
              TextSpan(
                text: ' App',
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: UflSizes.sm),
        Text(UflTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}