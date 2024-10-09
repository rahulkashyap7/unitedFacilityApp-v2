import 'package:flutter/material.dart';
import 'package:united_app/src/features/authentication/screens/privacy_policy/widget/privacy_policy_text_string.dart';
import '../../../../constants/image_strings.dart';
import '../user_settings/settings.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
                'Privacy Policy', // Added heading
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFEAA040)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                privacyPolicyTexts.privacyPolicySubTitle, // Added paragraph
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
                    '1. How We Use Your Information?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEAA040)), // Sub-heading style
                  ),
                  Text(
                    privacyPolicyTexts.UseData,
                    style: TextStyle(fontSize: 11), // Regular text style
                  ),
                  Text(
                    '2. Data Sharing and Disclosure',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEAA040)), // Sub-heading style
                  ),
                  Text(
                    privacyPolicyTexts.dataSharing,
                    style: TextStyle(fontSize: 11), // Regular text style
                  ),
                  Text(
                    '3. Data Security',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEAA040)), // Sub-heading style
                  ),
                  Text(
                    privacyPolicyTexts.dataSecurity,
                    style: TextStyle(fontSize: 11), // Regular text style
                  ),
                  Text(
                    '4. Data Retention',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEAA040)), // Sub-heading style
                  ),
                  Text(
                    privacyPolicyTexts.dataRetention,
                    style: TextStyle(fontSize: 11), // Regular text style
                  ),
                  Text(
                    '5. Third-Party Links',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEAA040)), // Sub-heading style
                  ),
                  Text(
                    privacyPolicyTexts.thirdPartyLinks,
                    style: TextStyle(fontSize: 11), // Regular text style
                  ),
                  Text(
                    '6. Contact Us',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEAA040)), // Sub-heading style
                  ),
                  Text(
                    privacyPolicyTexts.contactUs,
                    style: TextStyle(fontSize: 11), // Regular text style
                  ),
                  Divider(),
                  Text(
                    privacyPolicyTexts.privacyPolicyFooter,
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
