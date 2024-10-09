import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:united_app/globals.dart';
import '../../constants/colors.dart';
// Removed the image_strings import since it's no longer needed

class UflProfileTile extends StatelessWidget {
  const UflProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        child: const Icon(
          Iconsax.profile_circle, // User profile icon
          color: UflColors.white,
          size: 40, // Adjust size as needed
        ),
      ),
      title: Text(
        Globals.employeeName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: UflColors.white),
      ),
      subtitle: Text(
        Globals.employeeId,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: UflColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: UflColors.white),
      ),
    );
  }
}
