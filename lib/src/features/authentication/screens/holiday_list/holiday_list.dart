import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:united_app/src/constants/colors.dart';
import 'package:united_app/src/features/authentication/screens/holiday_list/widget/holiday_lists.dart';

class HolidayList extends StatelessWidget {
  const HolidayList({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController =
        ScrollController(); // Added ScrollController

    return Scaffold(
      appBar: AppBar(
        title: const Text('''Holiday's List'''),
      ),
      body: SingleChildScrollView(
        // Wrap ListView in SingleChildScrollView
        controller: scrollController, // Assign the ScrollController
        child: ListView.builder(
          physics:
              const NeverScrollableScrollPhysics(), // Disable ListView scrolling
          shrinkWrap: true, // Allow ListView to take only the needed space
          itemCount: UflHolidayList
              .allHolidayEvents.length, // Updated to 10 birthdays to list
          itemBuilder: (context, index) {
            const names = UflHolidayList.allHolidayEvents; // List of names

            const dates = UflHolidayList.allHolidayDates; // List of dates

            const days = UflHolidayList.allHolidayDays; // List of days

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
                        dates[index], // Use dynamic date from the list
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
                      left: 28,
                      top: 55,
                      child: Text(
                        names[index], // Use dynamic name from the list
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.68,
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
                        days[index], // Use dynamic day from the list
                        style: const TextStyle(
                          color: Color(0xFF727374),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          overflow: TextOverflow.ellipsis, // Handle overflow
                        ),
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
