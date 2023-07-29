import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AwesomeDialogDemo extends StatefulWidget {
  const AwesomeDialogDemo({super.key});

  @override
  State<AwesomeDialogDemo> createState() => _AwesomeDialogDemoState();
}

class _AwesomeDialogDemoState extends State<AwesomeDialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AwesomeDialog(
              context: context,
              // body: const Center(child: Text('Hyy ')),
              // btnOk: ElevatedButton(
              //   onPressed: () {},
              //   child: const Text('success'),
              // ),
              dialogType: DialogType.info,
              animType: AnimType.rightSlide,
              title: 'Dialog Title',
              desc: 'Dialog description here.............',
              btnCancelOnPress: () {},
              btnOkOnPress: () {},
            ).show();
          },
          child: const Text('Awesome Dialog'),
        ),
      ),
    );
  }
}
