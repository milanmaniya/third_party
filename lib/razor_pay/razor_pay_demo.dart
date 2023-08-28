import 'package:flutter/material.dart';

class RazerPayDemo extends StatefulWidget {
  const RazerPayDemo({super.key});

  @override
  State<RazerPayDemo> createState() => _RazerPayDemoState();
}

class _RazerPayDemoState extends State<RazerPayDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Pay'),
        ),
      ),
    );
  }
}
