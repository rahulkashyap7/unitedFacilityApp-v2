import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../../../globals.dart';
import '../../../../constants/colors.dart';
import 'package:http/http.dart' as http;

class AssetManagementScreen extends StatefulWidget {
  const AssetManagementScreen({super.key});

  @override
  State<AssetManagementScreen> createState() => _AssetManagementScreenState();
}

class _AssetManagementScreenState extends State<AssetManagementScreen> {
  List<dynamic> assetsList = [];
  bool isLoading = true; // Loading state

  void loadAssets() async {
    setState(() {
      isLoading = true; // Set loading to true before the request
    });

    http.Response response = await http.get(
      Uri.parse('${Globals.baseUrl}/assets?id=${Globals.employeeId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    final data = jsonDecode(response.body);
    print("result: $data");

    setState(() {
      // Update the assets variable with the data from the response
      print("Asset data: $data");
      assetsList = data['data'];
      isLoading = false; // Set loading to false after the data is loaded
    });
  }

  @override
  void initState() {
    super.initState();
    loadAssets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Management'),
      ),
      body: isLoading // Check if loading
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEAA040)),
              ), // Show loading indicator
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Total Assets: ${assetsList.length}',
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
                    padding: const EdgeInsets.only(
                        bottom: 16.0), // Added bottom padding
                    child: ListView.builder(
                      itemCount: assetsList.length,
                      itemBuilder: (context, index) {
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
                                    left: 107.56,
                                    top: 13.24,
                                    child: Text(
                                      Globals.employeeName,
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
                                      assetsList[index]['make'],
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
                                      assetsList[index]['system'],
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
                                            text: assetsList[index]['status'],
                                            style: const TextStyle(
                                              color: Colors.black,
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
                                        transform: Matrix4.identity()
                                          ..translate(0.0, 0.0)
                                          ..rotateZ(-0.19),
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
