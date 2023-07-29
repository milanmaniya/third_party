import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:third_party/shared_preference/counter_shared.dart';

class SharedPreferenceDemo extends StatefulWidget {
  const SharedPreferenceDemo({super.key});

  @override
  State<SharedPreferenceDemo> createState() => _SharedPreferenceDemoState();
}

class _SharedPreferenceDemoState extends State<SharedPreferenceDemo> {
  int number = CounterShared.getCounter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CounterShared.setCounter = ++number;
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          number.toString(),
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
