import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickMultiImageDemo extends StatefulWidget {
  const PickMultiImageDemo({super.key});

  @override
  State<PickMultiImageDemo> createState() => _PickMultiImageDemoState();
}

class _PickMultiImageDemoState extends State<PickMultiImageDemo> {
  List<File?> selectedFile = [];

  Future<void> selecteMultiImageFromGallery() async {
    ImagePicker pickImageData = ImagePicker();

    final xFileData = await pickImageData.pickMultiImage(imageQuality: 100);

    // List<XFile?> xFilledList = xFileData;

    setState(() {
      if (xFileData.isNotEmpty) {
        // for (int i = 0; i < xFileData.length; i++) {
        //   selectedFile.add(File(xFileData[i].path));
        // }

        for (var element in xFileData) {
          selectedFile.add(File(element.path));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await selecteMultiImageFromGallery();
                  setState(() {});
                },  
                child: const Text('Select Image'),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: selectedFile.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => CircleAvatar(
                      radius: 40,
                      backgroundImage: selectedFile.isNotEmpty
                          ? FileImage(selectedFile[index]!)
                          : const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://plus.unsplash.com/premium_photo-1689564003745-946f35267ffe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80'),
                            ) as ImageProvider),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
