import 'package:flutter/material.dart';
import 'package:united_app/src/features/authentication/screens/termAndConditions/widget/TAndC_Text.dart';
import '../../../../constants/image_strings.dart';
import '../user_settings/settings.dart';

class TermAndconditions extends StatelessWidget {
  const TermAndconditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Company logo in the AppBar
            Image.asset(
              UflImages.termAndCondtionImg,
              height: 110,
            ),
            const SizedBox(width: 10), // Title of the AppBar
            const Spacer(),
            InkWell(
              // Wrap CircleAvatar with InkWell for tap detection
              onTap: () {
                // Navigate to SettingsScreen when the user image is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()),
                );
              },
              child: const CircleAvatar(
                radius: 20, // Adjust the size of the circular avatar
                backgroundImage: AssetImage(
                    UflImages.userPic), // Replace with your user profile image
              ),
            ),
            const SizedBox(width: 10), // Space between the avatar and the edge
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text(
                'Terms and Conditions', // Added heading
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                UflTexts.termAndConditionsSubtitle, // Added paragraph
                style: TextStyle(fontSize: 11), // Paragraph style
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Introduction',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEAA040)), // Sub-heading style
                  ),
                  Text(
                    UflTexts.intro,
                    style: TextStyle(fontSize: 11), // Regular text style
                  ),
                  Text(
                    '2. Attendance and Leave Management',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEAA040)), // Sub-heading style
                  ),
                  Text(
                    UflTexts.attendanceAndLeaveManagement,
                    style: TextStyle(fontSize: 11), // Regular text style
                  ),
                  Text(
                    '3. Privacy and Data Collection',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEAA040)), // Sub-heading style
                  ),
                  Text(
                    UflTexts.privacyAndData,
                    style: TextStyle(fontSize: 11), // Regular text style
                  ),
                  Text(
                    '4. User Conduct',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEAA040)), // Sub-heading style
                  ),
                  Text(
                    UflTexts.userConduct,
                    style: TextStyle(fontSize: 11), // Regular text style
                  ),
                  Text(
                    '5. Limitation of Liability',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEAA040)), // Sub-heading style
                  ),
                  Text(
                    UflTexts.limitationOfLiability,
                    style: TextStyle(fontSize: 11), // Regular text style
                  ),
                  Text(
                    '6. Changes and Updates',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEAA040)), // Sub-heading style
                  ),
                  Text(
                    UflTexts.changesAndUpdates,
                    style: TextStyle(fontSize: 11), // Regular text style
                  ),
                  Text(
                    '7. Contact Information',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEAA040)), // Sub-heading style
                  ),
                  Text(
                    UflTexts.contactInfo,
                    style: TextStyle(fontSize: 11), // Regular text style
                  ),
                  Divider(),
                  Text(
                    UflTexts.tAndCFooter,
                    style: TextStyle(fontSize: 11), // Regular text style
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
