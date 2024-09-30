import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class UflTermsAndConditionCheckbox extends StatelessWidget {
  const UflTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UflHelperFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 20,
            height: 24,
            child: Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(width: UflSizes.spaceBtwItems),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${UflTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${UflTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? UflColors.white : UflColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor:
                  dark ? UflColors.white : UflColors.primary)),
          TextSpan(
              text: '${UflTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: UflTexts.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? UflColors.white : UflColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor:
                  dark ? UflColors.white : UflColors.primary)),
        ]))
      ],
    );
  }
}