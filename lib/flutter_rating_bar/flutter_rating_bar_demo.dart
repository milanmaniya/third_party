import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FlutterRatingBarDemo extends StatefulWidget {
  const FlutterRatingBarDemo({super.key});

  @override
  State<FlutterRatingBarDemo> createState() => _FlutterRatingBarDemoState();
}

class _FlutterRatingBarDemoState extends State<FlutterRatingBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            log('$rating');
          },
        ),
      ),
    );
  }
}
