import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';

class UflSocialButton extends StatelessWidget {
  const UflSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: UflColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(onPressed: () {},
            icon: const Image(width: UflSizes.iconMd,
              height: UflSizes.iconMd,
              image: AssetImage(UflImages.google),),),
        ),
        const SizedBox(width: UflSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: UflColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(onPressed: () {},
            icon: const Image(width: UflSizes.iconMd,
              height: UflSizes.iconMd,
              image: AssetImage(UflImages.email
              ),),),
        ),
      ],
    );
  }
}