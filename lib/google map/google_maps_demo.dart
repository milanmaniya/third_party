import 'package:flutter/material.dart';

class GoogleMapDemo extends StatefulWidget {
  const GoogleMapDemo({super.key});

  @override
  State<GoogleMapDemo> createState() => _GoogleMapDemoState();
}

class _GoogleMapDemoState extends State<GoogleMapDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // final mapOptions = MapOptions()
            //   ..zoom = 8
            //   ..center = LatLng(-34.397, 150.644);
            // GMap(
            //   "http://maps.googleapis.com/maps/api/js?libraries=LIBRARY1,LIBRARY2"
            //       as HtmlElement,
            //   mapOptions,
            // );
          },
          child: const Text('Google Map'),
        ),
      ),
    );
  }
}
