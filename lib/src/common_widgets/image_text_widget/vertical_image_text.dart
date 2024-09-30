import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class UflVerticalImageText extends StatelessWidget {
  const UflVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = UflColors.white,
    this.onTap,
    this.backgroundColor = UflColors.white,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: UflSizes.spaceBtwItems),
        child: Column(
          children: [
            // Circular icons
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(UflSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (UflHelperFunction.isDarkMode(context) ? UflColors.black : UflColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Text
            const SizedBox(height: UflSizes.spaceBtwItems / 2),
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ),
      ),
    );
  }
}