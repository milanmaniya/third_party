import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VideoPickerDemo extends StatefulWidget {
  const VideoPickerDemo({super.key});

  @override
  State<VideoPickerDemo> createState() => _VideoPickerDemoState();
}

class _VideoPickerDemoState extends State<VideoPickerDemo> {
  final ImagePicker image = ImagePicker();

  File? file;

  Future<void> selectVideoFromCamera() async {
    XFile? xfile = await image.pickVideo(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      maxDuration: const Duration(minutes: 10),
    );

    if (xfile != null) {
      file = File(xfile.path);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text('Pick Video'),
            ),
          ],
        ),
      ),
    );
  }
}
