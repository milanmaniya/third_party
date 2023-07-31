import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:third_party/flutter%20toast/flutter_toast_demo.dart';

class PermissionHandlerDemo extends StatefulWidget {
  const PermissionHandlerDemo({super.key});

  @override
  State<PermissionHandlerDemo> createState() => _PermissionHandlerDemoState();
}

class _PermissionHandlerDemoState extends State<PermissionHandlerDemo> {
  void accessCamera() async {
    bool isDenied = await Permission.camera.isDenied;

    if (isDenied) {
      final status = await Permission.camera.request();

      if (status.isGranted) {
        CommonToast().displayToast('Permission is granted');
      }
      if (status.isDenied) {
        CommonToast().displayToast('Permission is denied');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                accessCamera();
              },
              child: const Text('Camera Access'),
            ),
          ],
        ),
      ),
    );
  }
}
