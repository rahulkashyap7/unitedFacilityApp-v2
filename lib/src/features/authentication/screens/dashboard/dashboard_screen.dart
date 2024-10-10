import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:united_app/src/constants/image_strings.dart';
import 'package:intl/intl.dart';
import 'package:united_app/src/features/authentication/screens/birthday_list/birthday_list_screen.dart';
import 'package:united_app/src/features/authentication/screens/exit_management/exit_management.dart';
import 'package:united_app/src/features/authentication/screens/holiday_list/holiday_list.dart';
import 'package:united_app/src/features/authentication/screens/leave_management/leave_manegment.dart';
import '../asset_management/asset_management_screen.dart';
import '../mark_attendance/attendence_detail.dart';
import '../mark_attendance/punch_inout_screen.dart';
import '../user_settings/settings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the current date and time
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yMMMMd').format(now); // Format date
    String formattedTime = DateFormat('HH:mm a').format(now);

    // Determine the greeting based on the current hour
    String greeting;
    int hour = now.hour;
    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 17) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove the back arrow
        title: Row(
          children: [
            // Company logo in the AppBar
            Image.asset(
              UflImages.darkAppLogo, // Update with your logo path
              height: 40, // Adjust height as needed
            ),
            const SizedBox(width: 10), // Title of the AppBar
            const Spacer(), // Pushes the user image to the right
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
      body: SingleChildScrollView(
        // Enable smooth scrolling
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Top section with greeting and current date/time
              Container(
                // Mark Attendance Container
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAA040),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          greeting, // Display the greeting
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          formattedDate, // Display the formatted date
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          formattedTime, // Display the formatted time with seconds
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    // Align the button to the bottom right
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Redirect to PunchInAndOutScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PunchInOutScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Background color
                          foregroundColor: Colors.black, // Text color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5), // Adjust padding for size
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                          elevation: 5, // Add elevation for drop shadow
                        ),
                        child: const Row(
                          mainAxisSize:
                              MainAxisSize.min, // Adjust to fit content
                          children: [
                            Icon(Iconsax
                                .direct_right), // Add an icon to the button
                            SizedBox(width: 5), // Space between icon and text
                            Text(
                              "Mark Attendance",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),

              // Middle section with metrics
              GridView.count(
                shrinkWrap:
                    true, // Allow GridView to take only the space it needs
                physics:
                    const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildDashboardItem(
                      context, // Pass the context as the first argument
                      'Attendance',
                      UflImages.attendance,
                      const Color(0xFFDEEBFB),
                      const Color(0xFF084795),
                      const Color(0xFFC4DDFC),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AttendenceDetail()),
                      );
                    },
                  ),
                  // Shadow color for Attendance
                  _buildDashboardItem(
                      context, // Pass the context as the first argument
                      'Leave Management',
                      UflImages.leave,
                      const Color(0xFFFBFDF6),
                      const Color(0xFF608600),
                      const Color(0xFFE9F8BF),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LeaveManagement()),
                      );
                    },
                  ),
                  _buildDashboardItem(
                    context, // Pass the context as the first argument
                    'Asset Management',
                    UflImages.asset,
                    const Color(0xFFFEFBF7),
                    const Color(0xFF000000),
                    const Color(0xFFE5E4E4),
                    onTap: () {
                      // Added onTap event
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AssetManagementScreen()), // Redirect to AssetManagementScreen
                      );
                    },
                  ),
                  // Shadow color for Asset Management
                  _buildDashboardItem(
                    context, // Pass the context as the first argument
                    'Birthdays List',
                    UflImages.birthdayList,
                    const Color(0xFFFDF5F3),
                    const Color(0xFFAA0017),
                    const Color(0xFFFDE0E4),
                    onTap: () {
                      // Added onTap event
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const BirthdayListScreen()), // Redirect to AssetManagementScreen
                      );
                    },
                  ),
                  // Shadow color for Birthday's List
                  _buildDashboardItem(
                    context, // Pass the context as the first argument
                    "Holidays",
                    UflImages.holiday,
                    const Color(0xFFFDF5F3),
                    const Color(0xFFD49351),
                    const Color(0xFFFCE7D2),
                    onTap: () {
                      // Added onTap event
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const HolidayList()),
                      );
                    },
                  ),
                  // Shadow color for Holidays
                  _buildDashboardItem(
                    context, // Pass the context as the first argument
                    'Assistance',
                    UflImages.assistance,
                    const Color(0xFFFDF5F3),
                    const Color(0xFFE176BF),
                    const Color(0xFFFCE2F3),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LeaveManagement()),
                      );
                    },
                  ),
                  // Shadow color for Assistance
                  _buildDashboardItem(
                      context, // Pass the context as the first argument
                      'Exit Management',
                      UflImages.exit,
                      const Color(0xFFFEFBF7),
                      const Color(0xFF7114E5),
                      const Color(0xFFE7D7FC),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExitManagement()),
                      );
                    },
                  ),
                  // Shadow color for Exit Management
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardItem(BuildContext context, String title,
      String imagePath, Color color, Color borderColor, Color shadowColor,
      {VoidCallback? onTap}) {
    // Added onTap parameter
    Color textColor; // Declare a variable for text color

    // Set text color based on the title
    switch (title) {
      case 'Attendance':
        textColor = const Color(0xFF084795);
        break;
      case 'Leave Management':
        textColor = const Color(0xFF608600);
        break;
      case 'Documents':
        textColor = const Color(0xFFEAA040);
        break;
      case 'Asset Management':
        textColor = const Color(0xFF000000);
        break;
      case 'Birthdays List':
        textColor = const Color(0xFFAA0017);
        break;
      case 'Holidays':
        textColor = const Color(0xFFD49351);
        break;
      case 'Assistance':
        textColor = const Color(0xFFE176BF);
        break;
      case 'Exit Management':
        textColor = const Color(0xFF7114E5);
        break;
      default:
        textColor = Colors.black; // Default text color
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0, // Set elevation to 0 to avoid default shadow
      child: InkWell(
        onTap: onTap ?? () {}, // Use the onTap parameter or do nothing
        child: Container(
          padding: EdgeInsets.zero, // No padding for the card
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color.withOpacity(0.1),
            border: Border.all(
              color: borderColor, // Different border color for each card
              width: 2, // Border width
            ),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.5), // Set the shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 10, // Blur radius
                offset: const Offset(2, 5), // Offset for the shadow
              ),
            ],
          ),
          child: Stack(
            // Use Stack to position elements
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Align text to the start (top left)
                children: [
                  Padding(
                    // Add padding only to the text
                    padding:
                        const EdgeInsets.all(10), // Adjust padding as needed
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 14, // Adjusted font size
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                        color: textColor, // Set the text color
                      ),
                      textAlign: TextAlign.left, // Align text to left
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              Positioned(
                // Position the image at the bottom right
                bottom: -40, // Adjust to fit within the card
                right: -35, // Adjust to fit within the card
                child: ClipRect(
                  // Clip the image to prevent overflow
                  child: Transform.rotate(
                    // Rotate only for specific titles
                    angle: (title == 'Leave Management' ||
                            title == 'Documents' ||
                            title == 'Asset Management' ||
                            title == 'Birthdays List' ||
                            title == 'Holidays' ||
                            title == 'Exit Management')
                        ? 0.5
                        : 0, // Rotate if title matches
                    child: Image.asset(
                      imagePath,
                      height: 160, // Adjusted height of the image
                      width: 160, // Adjusted width of the image
                      fit: BoxFit
                          .cover, // Ensure the image fits within the bounds
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
