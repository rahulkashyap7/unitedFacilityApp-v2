import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:united_app/globals.dart';
import '../../../../constants/colors.dart';
import 'package:intl/intl.dart'; // Import intl package for date formatting
import 'package:http/http.dart' as http;

class AttendenceDetail extends StatefulWidget {
  const AttendenceDetail({super.key});

  @override
  State<AttendenceDetail> createState() => _AttendenceDetailState();
}

class _AttendenceDetailState extends State<AttendenceDetail> {
  List<dynamic> attendenceList = [];

  void loadAttendence() async {
    http.Response response = await http.get(
      Uri.parse(
          '${Globals.baseUrl}/attendence?id=${Globals.employeeId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final data = jsonDecode(response.body);

    setState(() {
      // Update the birthdays variable with the data from the response
      print("the data attendence: $data");
      attendenceList = data['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadAttendence();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController =
        ScrollController(); // Added ScrollController

    // Get the current date
    DateTime now = DateTime.now();
    String currentDate = DateFormat('yMMMMd').format(now); // Format the date
    String currentDay = DateFormat('EEEE').format(now); // Get the current day

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Details'),
      ),
      body: SingleChildScrollView(
        // Wrap ListView in SingleChildScrollView
        controller: scrollController, // Assign the ScrollController
        child: ListView.builder(
          physics:
              const NeverScrollableScrollPhysics(), // Disable ListView scrolling
          shrinkWrap: true, // Allow ListView to take only the needed space
          itemCount: attendenceList.length, // Set to 1 for current date
          itemBuilder: (context, index) {
            // Use the current date
            String punchInTime = (attendenceList[index]['checkInTime']); // Replace with actual data
            String punchOutTime = (attendenceList[index]['checkOutTime']); // Replace with actual data

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 334,
                height: 98,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 334,
                        height: 98,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                              // Added border
                              color: Colors.grey, // Grey color for the border
                              width: 1, // Border width
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 62,
                      top: 23,
                      child: Text(
                        currentDate, // Use the current date
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 12,
                        height: 98,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFE9A03F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 27,
                      top: 18,
                      child: Container(
                        width: 25,
                        height: 25,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: const Icon(
                          Iconsax.calendar_1,
                          color: UflColors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 263,
                      top: 23,
                      child: Text(
                        currentDay, // Display the current day
                        style: const TextStyle(
                          color: Color(0xFF727374),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 62,
                      top: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Row for login and logout icons with times
                          Row(
                            children: [
                              // Login icon and time
                              Row(
                                children: [
                                  const Icon(
                                    Iconsax.login, // Login icon
                                    size: 16,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(
                                      width: 5), // Space between icon and time
                                  Text(
                                    punchInTime, // Display punch-in time
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                  width: 20), // Space between login and logout
                              // Logout icon and time
                              Row(
                                children: [
                                  const Icon(
                                    Iconsax.logout, // Logout icon
                                    size: 16,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(
                                      width: 5), // Space between icon and time
                                  Text(
                                    punchOutTime, // Display punch-out time
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
