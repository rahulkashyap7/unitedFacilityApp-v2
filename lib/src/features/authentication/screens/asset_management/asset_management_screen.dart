import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class AssetManagementScreen extends StatelessWidget {
  const AssetManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of assets
    final List<Map<String, String>> assets = [
      {
        'id': 'LG00001',
        'name': 'HP Laptop 330 (i5, Intel)',
        'brand': 'HP',
        'user': 'Rahul Kashyap',
        'condition': 'Working',
      },
      {
        'id': 'LG00002',
        'name': 'Dell Inspiron 15 (i7, Intel)',
        'brand': 'Dell',
        'user': 'Anita Sharma',
        'condition': 'Working',
      },
      {
        'id': 'LG00003',
        'name': 'Lenovo ThinkPad X1',
        'brand': 'Lenovo',
        'user': 'John Doe',
        'condition': 'Needs Repair',
      },
      {
        'id': 'LG00004',
        'name': 'Asus ZenBook 14',
        'brand': 'Asus',
        'user': 'Emily Clark',
        'condition': 'Working',
      },
      {
        'id': 'LG00005',
        'name': 'Acer Aspire 5',
        'brand': 'Acer',
        'user': 'Michael Brown',
        'condition': 'Working',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Management'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Total Assets: ${assets.length}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0), // Added bottom padding
              child: ListView.builder(
                itemCount: assets.length,
                itemBuilder: (context, index) {
                  final asset = assets[index];
                  return Column(
                    children: [
                      Container(
                        width: 316.06,
                        height: 115.83,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11.58),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 89.36,
                                height: 115.83,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE9A03F),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(11.58),
                                    bottomLeft: Radius.circular(11.58),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 14.29,
                              top: 83.93,
                              child: Text(
                                'Id: ${asset['id']}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.74,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 107.56,
                              top: 13.24,
                              child: Text(
                                asset['name']!,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.24,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 107.56,
                              top: 37.50,
                              child: Text(
                                'Brand: ${asset['brand']}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.24,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 107.56,
                              top: 60.71,
                              child: Text(
                                'User: ${asset['user']}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13.24,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 107.56,
                              top: 83.93,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Condition: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13.24,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                    TextSpan(
                                      text: asset['condition']!,
                                      style: const TextStyle(
                                        color: Color(0xFF33C023),
                                        fontSize: 13.24,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              left: 25,
                              top: 33.93,
                              child: Icon(
                                Icons.laptop,
                                size: 41.07,
                                color: UflColors.white,
                              ),
                            ),
                            Positioned(
                              left: 158.92,
                              top: 61.44,
                              child: Opacity(
                                opacity: 0.40,
                                child: Transform(
                                  transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.19),
                                  child: Container(
                                    width: 294.63,
                                    height: 244.63,
                                    decoration: const BoxDecoration(
                                      color: Color(0x7FE9A03F),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16), // Space between items
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
