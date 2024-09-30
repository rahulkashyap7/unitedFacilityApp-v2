import 'package:flutter/material.dart';
import 'package:united_app/src/utils/helpers/helper_functions.dart';
import '../../../../../constants/colors.dart';

class UflDivider extends StatelessWidget {
  const UflDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = UflHelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? UflColors.darkGrey : UflColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(child: Divider(color: dark ? UflColors.darkGrey : UflColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
      ],
    );
  }
}