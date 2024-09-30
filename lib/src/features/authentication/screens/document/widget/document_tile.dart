import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../constants/colors.dart';

class UflDocumentTile extends StatelessWidget {
  const UflDocumentTile({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 80,
        decoration: ShapeDecoration(
          color: const Color(0x19E9A03F),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Color(0xFFE9A03F)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: InkWell(
          // Added InkWell for onPressed effect
          onTap: () {
            // Added onTap event
            // Handle the tap event here
            print('Tile pressed!'); // Example action
          },
          child: ListTile(
            leading: Container(
              width: 62,
              height: 63.61,
              decoration: ShapeDecoration(
                color: const Color(0xFFE9A03F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.05),
                ),
              ),
              child: Icon(
                Iconsax.document_text,
                color: Theme.of(context).brightness == Brightness.light
                    ? UflColors.light// White for light mode
                    : UflColors.dark, // Black for dark mode
              ),
            ),
            title: Text(title),
          ),
        ),
      ),
    );
  }
}
