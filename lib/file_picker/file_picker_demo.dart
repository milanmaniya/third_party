import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilePickerDemo extends StatefulWidget {
  const FilePickerDemo({super.key});

  @override
  State<FilePickerDemo> createState() => _FilePickerDemoState();
}

class _FilePickerDemoState extends State<FilePickerDemo> {
  String filepath = '';

  @override
  Widget build(BuildContext context) {
    Future<void> pickFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.any,
      );

      if (result != null && result.files.single.path != null) {
        PlatformFile file = result.files.first;

        log(file.name);
        log(file.extension!);
        log(file.path!);

        File _file = File(result.files.single.path!);

        setState(() {
          filepath = _file.path;
        });
      }
    }

    Future<void> pickMultipleFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.any,
      );

      if (result != null) {
        List<File> file = result.paths.map((e) => File(e!)).toList();

        setState(() {
          filepath = file.toString();
        });
      }
    }

    Future<void> pickDirectory() async {
      String? selectDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectDirectory != null) {
        setState(() {
          filepath = selectDirectory;
        });
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  pickFile();
                },
                child: const Text('pick file'),
              ),
              ElevatedButton(
                onPressed: () {
                  pickMultipleFile();
                },
                child: const Text('pick Multiple file'),
              ),
              ElevatedButton(
                onPressed: () {
                  pickDirectory();
                },
                child: const Text('pick directory'),
              ),
              ElevatedButton(
                onPressed: () {
                  pickDirectory();
                },
                child: const Text('save file'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
