import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants/colors.dart';
import '../../constants/image_strings.dart';
import '../images/ufl_rounded_image.dart';


class UflProfileTile extends StatelessWidget {
  const UflProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const UflRoundedImage(
        imageUrl: UflImages.userPic,
        width: 50,
        height: 50,
        padding: EdgeInsets.zero,
      ),
      title: Text('United User', style: Theme.of(context).textTheme.headlineSmall!.apply(color: UflColors.white)),
      subtitle: Text('U105456', style: Theme.of(context).textTheme.bodyMedium!.apply(color: UflColors.white)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: UflColors.white)),
    );
  }
}