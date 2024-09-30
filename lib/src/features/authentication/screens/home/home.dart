import 'package:flutter/material.dart';

class BirthdayListScreen extends StatelessWidget {
  const BirthdayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Birthday List'),
      ),
      body: ListView.builder(
        itemCount: 10, // Assuming there are 10 birthdays to list
        itemBuilder: (context, index) {
          return Container(
            width: 334,
            height: 98,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 4,
                  offset: Offset(4, 4),
                  spreadRadius: 0,
                )
              ],
            ),
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
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 62,
                  top: 23,
                  child: Text(
                    'January  02, 2024', // Replace with dynamic date if needed
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Arial Rounded MT Bold',
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
                const Positioned(
                  left: 28,
                  top: 55,
                  child: Text(
                    'PC Jha', // Replace with dynamic name if needed
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Arial Rounded MT Bold',
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
                    child: const FlutterLogo(),
                  ),
                ),
                const Positioned(
                  left: 263,
                  top: 23,
                  child: Text(
                    'Monday', // Replace with dynamic day if needed
                    style: TextStyle(
                      color: Color(0xFF727374),
                      fontSize: 14,
                      fontFamily: 'Arial Rounded MT Bold',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 270,
                  top: 48,
                  child: Container(
                    width: 33,
                    height: 33,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://via.placeholder.com/33x33"),
                        fit: BoxFit.cover,
                      ),
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xFFE9A03F)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
