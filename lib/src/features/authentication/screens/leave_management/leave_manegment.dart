import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';

class LeaveManagement extends StatelessWidget {
  const LeaveManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // Center the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            FittedBox(
              child: Image(
                // Placeholder for the image
                image: AssetImage(UflImages.update),
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
