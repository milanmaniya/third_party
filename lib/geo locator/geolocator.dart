import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:third_party/flutter%20toast/flutter_toast_demo.dart';

class GeoLocatorDemo extends StatefulWidget {
  const GeoLocatorDemo({super.key});

  @override
  State<GeoLocatorDemo> createState() => _GeoLocatorDemoState();
}

class _GeoLocatorDemoState extends State<GeoLocatorDemo> {
  Position? position;

  LocationPermission? permission;

  getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return CommonToast().displayToast('Services is disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return CommonToast().displayToast('Location permission is denied ');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return CommonToast()
          .displayToast('Location permission is denied forever');
    }

    Position currentPosition = await Geolocator.getCurrentPosition();
    setState(() {
      position = currentPosition;
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
                getCurrentPosition();
                setState(() {});
              },
              child: const Text('Current Location'),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(position != null ? position.toString() : 'position denied'),
          ],
        ),
      ),
    );
  }
}
