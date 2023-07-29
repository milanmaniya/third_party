import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  State<ImagePickerDemo> createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  File? file;

  Future<void> selecteImageFromGallery() async {
    ImagePicker pickImageData = ImagePicker();

    XFile? xfile = await pickImageData.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    file = xfile != null ? File(xfile.path) : null;
    setState(() {});
  }

  Future<void> selecteImageFromCamera() async {
    ImagePicker pickImageData = ImagePicker();

    XFile? xfile = await pickImageData.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );

    file = xfile != null ? File(xfile.path) : null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: file != null
                      ? FileImage(file!)
                      : const NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1689564003745-946f35267ffe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
                        ) as ImageProvider,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    selecteImageFromGallery();
                    setState(() {});
                  },
                  child: const Text('upload from gallery'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    selecteImageFromCamera();
                    setState(() {});
                  },
                  child: const Text('Take picture'),
                ),
              ],
            ),
          ),
        ));
  }
}
