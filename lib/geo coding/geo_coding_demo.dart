import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:third_party/flutter%20toast/flutter_toast_demo.dart';

class GeoCodingDemo extends StatefulWidget {
  const GeoCodingDemo({super.key});

  @override
  State<GeoCodingDemo> createState() => _GeoCodingDemoState();
}

class _GeoCodingDemoState extends State<GeoCodingDemo> {
  Position? position;
  String address = '';

  getCurrentLocation() async {
    bool isEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isEnabled) {
      CommonToast().displayToast('permission is not enabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        CommonToast().displayToast('permisson is denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      CommonToast().displayToast('Permission is denied forever');
    }

    Position currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemark = await placemarkFromCoordinates(
        currentPosition.latitude, currentPosition.longitude);
    Placemark place = placemark[0];

    setState(() {
      position = currentPosition;
      address =
          '${place.locality} ${place.subLocality} ${place.street} ${place.country} ${place.postalCode}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                getCurrentLocation();
              },
              child: const Text('Geo Coding'),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              textAlign: TextAlign.center,
              position != null ? '$address \n ' : 'not found',
            ),
          ],
        ),
      ),
    );
  }
}
