
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationGeofenceScreen extends StatefulWidget {
  const LocationGeofenceScreen({Key? key}) : super(key: key);

  @override
  _LocationGeofenceScreenState createState() => _LocationGeofenceScreenState();
}

class _LocationGeofenceScreenState extends State<LocationGeofenceScreen> {
  String _locationMessage = "Getting Location...";
  String _statusMessage = "";
  final double _targetLat = 28.69213327950111;
  final double _targetLong = 77.14745236016321;
  final double _radiusInMeters = 100.0;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission(); // Request permission

    if (permission == LocationPermission.denied) {
      setState(() {
        _locationMessage = "Location permission denied.";
      });
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _locationMessage =
      "Lat: ${position.latitude}, Long: ${position.longitude}";
    });

    _checkLocation(position);
  }

  void _checkLocation(Position position) {
    double distance = Geolocator.distanceBetween(
      _targetLat,
      _targetLong,
      position.latitude,
      position.longitude,
    );

    // Debugging: Log the calculated distance
    print("Calculated distance: $distance meters");

    setState(() {
      _statusMessage = distance <= _radiusInMeters
          ? "You are within the geofence."
          : "You are outside the geofence.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Location & Geofence'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_locationMessage),
            SizedBox(height: 20),
            Text(_statusMessage),
          ],
        ),
      ),
    );
  }
}