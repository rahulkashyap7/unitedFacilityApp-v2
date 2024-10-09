import 'package:flutter/material.dart';
import '../../../../constants/image_strings.dart';

class NoNotifications extends StatelessWidget {
  const NoNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // Center the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            Image(
              // Placeholder for the image
              image: AssetImage(UflImages.noNotification),
              height: 150,
            ),
            SizedBox(height: 20), // Space between image and text
            Text(
              'There is no notification', // Error message
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Text style
              textAlign: TextAlign.center, // Center the text
            ),
          ],
        ),
      ),
    );
  }
}