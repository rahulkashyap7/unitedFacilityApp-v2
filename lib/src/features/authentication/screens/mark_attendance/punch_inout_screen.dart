import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:united_app/globals.dart';
import 'dart:async';
import '../../../../constants/image_strings.dart';
import 'package:http/http.dart' as http;

class PunchInOutScreen extends StatefulWidget {
  const PunchInOutScreen({super.key});

  @override
  _PunchInOutScreenState createState() => _PunchInOutScreenState();
}

class _PunchInOutScreenState extends State<PunchInOutScreen> {
  var formatter = DateFormat('yyyy-MM-dd');
  var now = DateTime.now();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late Location location; // Declare location variable
  late StreamSubscription<LocationData>
      _locationSubscription; // Subscription for location updates

  String punchInTime = '--:--:--';
  String punchInStatus = 'Not Punched In';
  String punchOutTime = '--:--:--';
  String punchOutStatus = 'Not Punched Out';
  String workingHours = '--:--:--';
  bool isPunchedIn = false;
  bool isPunchedOut = false;
  DateTime? punchInDateTime;
  DateTime? punchOutDateTime;

  bool resetScreen = false;

  double lat = 0.0;
  double long = 0.0;
  bool isLocResolved = false; // Track location resolution status
  // Geofencing center coordinates and radius
  final LatLng _geofenceCenter = const LatLng(28.6919, 77.1475);
  final double _geofenceRadius = 100; // 100 meters
  bool _isWithinGeofence = false; // Track if the user is within the geofence
  bool _geofenceAlertShown = false;

  Timer? midnightTimer; // Timer for midnight reset

  @override
  void initState() {
    super.initState();
    location = Location(); // Initialize location
    _getCurrentLocation(); // Get current location
    _loadSavedState(); // Load saved state
  }

  void _getCurrentLocation() async {
    // Check if the location service is enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      // Request the user to enable the location service
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        // Handle service not enabled
        if (mounted) {
          setState(() {
            isLocResolved = true;
          });
        }
        return;
      }
    }

    // Check for location permission
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      // Request permission from the user
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        // Handle permission not granted
        if (mounted) {
          setState(() {
            isLocResolved = true;
          });
        }
        return;
      }
    }

    // If permission is granted, listen for location changes
    _locationSubscription =
        location.onLocationChanged.listen((LocationData currentLocation) {
      if (mounted) {
        setState(() {
          lat = currentLocation.latitude!;
          long = currentLocation.longitude!;
          _checkGeofencingStatus();
        });
      }
    });
  }

  @override
  void dispose() {
    midnightTimer?.cancel(); // Cancel the timer when disposing
    _locationSubscription.cancel(); // Cancel the subscription when disposing
    super.dispose();
  }

  // Check if the user is inside or outside the geofencing area
  void _checkGeofencingStatus() {
    const distance = Distance(); // Use the latlong2 Distance object

    // Calculate the distance between the user's location and the geofence center
    double distanceToCenter =
        distance.as(LengthUnit.Meter, LatLng(lat, long), _geofenceCenter);

    // Compare the calculated distance to the geofence radius
    if (distanceToCenter <= _geofenceRadius) {
      _isWithinGeofence = true; // User is within the geofence
      if (!_geofenceAlertShown) {
        // Check if alert has not been shown
        _showGeofenceAlert('You are in Geo Fencing');
        _geofenceAlertShown =
            true; // Set the flag to true after showing the alert
      }
    } else {
      _isWithinGeofence = false; // User is outside the geofence
      if (_geofenceAlertShown) {
        // Check if alert was shown before
        _showGeofenceAlert('You are Outside of Geofencing');
        _geofenceAlertShown = false; // Reset the flag when user is outside
      }
    }
  }

  void _showGeofenceAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Geofencing Status"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _loadSavedState() async {
    final prefs = await SharedPreferences.getInstance();

    bool? tmpResetVal = prefs.getBool("resetScreen");
    String curDate = formatter.format(now);
    String? storedDate = prefs.getString("todayDate");

    final savedPunchInTime = prefs.getString('punchInTime');
    final savedPunchOutTime = prefs.getString('punchOutTime');


    print("inside loadstate: $tmpResetVal $curDate $storedDate");

    if (storedDate == null) {
      prefs.getString("todayDate");
    }

    setState(() {
      if (tmpResetVal == null) {
        // first day
        prefs.setBool("resetScreen", false);
      } else if (tmpResetVal && curDate != storedDate) {
        _resetPunchStates();
      } else {
        if (savedPunchInTime != null) {
          punchInDateTime = DateTime.parse(savedPunchInTime);
          punchInTime = DateFormat('HH:mm:ss').format(punchInDateTime!);
          punchInStatus = 'Punched In';
          isPunchedIn = true;
        }


        if (savedPunchOutTime != null) {
          punchOutDateTime = DateTime.parse(savedPunchOutTime);
          punchOutTime = DateFormat('HH:mm:ss').format(punchOutDateTime!);
          punchOutStatus = 'Punched Out';
          isPunchedOut = true;
        }

        isPunchedIn = prefs.getBool('isPunchedIn') ?? false;
        isPunchedOut = prefs.getBool('isPunchedOut') ?? false;
      }
      _calculateWorkingHours();
    });
  }

  Future<void> _saveState() async {
    final prefs = await SharedPreferences.getInstance();
    if (punchInDateTime != null) {
      await prefs.setString('punchInTime', punchInDateTime!.toIso8601String());
    }
    if (punchOutDateTime != null) {
      await prefs.setString(
          'punchOutTime', punchOutDateTime!.toIso8601String());
    }
    await prefs.setBool('isPunchedIn', isPunchedIn);
    await prefs.setBool('isPunchedOut', isPunchedOut);
  }

  void _handlePunchIn() async {
    if (!isPunchedIn) {
      punchInDateTime = DateTime.now();
      print("The employee: ${Globals.employeeName} and ${Globals.employeeId}");
      http.Response response = await http.post(
        Uri.parse('${Globals.baseUrl}/checkin'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "employeeId": Globals.employeeId.toString(),
          "time": punchInDateTime.toString(),
          "latitude": lat,
          "longitude": long
        }),
      );
      print("getting punchin data: $response");
      setState(() {
        punchInTime = DateFormat('HH:mm:ss').format(punchInDateTime!);
        punchInStatus = 'Punched In';
        isPunchedIn = true;
        isPunchedOut = false; // Reset punch out status
      });
      _saveState();
    }
  }

  void _handlePunchOut() async {
    if (isPunchedIn && !isPunchedOut) {
      punchOutDateTime = DateTime.now();
      print("The employee: ${Globals.employeeName} and ${Globals.employeeId}");
      http.Response response = await http.post(
        Uri.parse('${Globals.baseUrl}/checkout'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "employeeId": Globals.employeeId.toString(),
          "time": punchOutDateTime.toString(),
          "latitude": lat,
          "longitude": long
        }),
      );
      final data = jsonDecode(response.body);
      if (data['status'] == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool("resetScreen", true);

        String formattedDate = formatter.format(now);

        await prefs.setString("todayDate", formattedDate);

        setState(() {
          punchOutTime = DateFormat('HH:mm:ss').format(punchOutDateTime!);
          punchOutStatus = 'Punched Out';
          isPunchedOut = true;
          _calculateWorkingHours();
        });
        _saveState();
      }
    }
  }

  void _resetPunchStates() {
    setState(() {
      isPunchedIn = false; // Reset punch in status
      isPunchedOut = false; // Reset punch out status
      punchInTime = '--:--:--'; // Reset punch in time display
      punchOutTime = '--:--:--'; // Reset punch out time display
      punchInStatus = 'Not Punched In'; // Reset punch in status display
      punchOutStatus = 'Not Punched Out';
    });
  }

  void _calculateWorkingHours() {
    if (punchInDateTime != null && punchOutDateTime != null) {
      Duration difference = punchOutDateTime!.difference(punchInDateTime!);
      int hours = difference.inHours;
      int minutes = difference.inMinutes.remainder(60);
      int seconds = difference.inSeconds.remainder(60);
      workingHours =
          '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      workingHours = '--:--:--';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _buildCalendarContainer(context),
              const SizedBox(height: 20),
              _buildAttendanceDetails(context),
              const Spacer(),
              _buildPunchButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAttendanceDetails(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.25,
      children: [
        _buildDetailCard(context, 'Punch In', punchInTime, punchInStatus),
        _buildDetailCard(context, 'Punch Out', punchOutTime, punchOutStatus),
        _buildDetailCard(
            context, 'Working\nHours', workingHours, 'Total Working Hours'),
        _buildDetailCard(context, 'Attendance\nDetails', '25', 'Working Days'),
      ],
    );
  }

  Widget _buildDetailCard(
      BuildContext context, String title, String time, String subtitle) {
    IconData iconData;
    switch (title) {
      case 'Punch In':
        iconData = Iconsax.login;
        break;
      case 'Punch Out':
        iconData = Iconsax.logout;
        break;
      case 'Working\nHours':
        iconData = Iconsax.clock;
        break;
      case 'Attendance\nDetails':
        iconData = Iconsax.calendar;
        break;
      default:
        iconData = Iconsax.clock;
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9A03F),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Icon(iconData, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              time,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPunchButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isPunchedIn || !_isWithinGeofence
                  ? Colors.grey
                  : const Color(0xFF60B158),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: isPunchedIn || !_isWithinGeofence
                ? null
                : () {
                    _handlePunchIn(); // Call the punch in method
                  },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Iconsax.login, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Punch In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  (isPunchedOut || !isPunchedIn || !_isWithinGeofence)
                      ? Colors.grey
                      : const Color(0xFFFF6961),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: (isPunchedOut || !isPunchedIn || !_isWithinGeofence)
                ? null
                : () {
                    _handlePunchOut(); // Call the punch out method
                  },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Iconsax.logout, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Punch Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarContainer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFD9D9D9)),
      ),
      child: SizedBox(
        child: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(28.6919, 77.1475),
            initialZoom: 16,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.united_app',
            ),
            MarkerLayer(markers: [
              Marker(
                point: LatLng(lat, long),
                width: 35,
                height: 35,
                child: Image.asset(UflImages.lightAppLogo), //TODO
              ),
            ]),
            CircleLayer(circles: [
              CircleMarker(
                  point: const LatLng(28.6919, 77.1475),
                  color: Colors.blue.withOpacity(0.5),
                  radius: 50,
                  useRadiusInMeter: true)
            ]),
          ],
        ),
      ),
    );
  }
}
