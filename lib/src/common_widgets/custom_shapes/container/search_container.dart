import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class UflSearchContainer extends StatelessWidget {
  const UflSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = UflHelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: UflSizes.defaultSpace),
        child: Container(
          width: UflDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(UflSizes.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? UflColors.dark
                      : UflColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(UflSizes.cardRadiusLg),
              border: showBorder
                  ? Border.all(color: UflColors.grey.withOpacity(0.1))
                  : null),
          child: Row(
            children: [
              Icon(icon, color: UflColors.darkGrey),
              const SizedBox(width: UflSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}
