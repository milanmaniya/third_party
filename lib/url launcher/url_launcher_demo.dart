import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherDemo extends StatefulWidget {
  const UrlLauncherDemo({super.key});

  @override
  State<UrlLauncherDemo> createState() => _UrlLauncherDemoState();
}

class _UrlLauncherDemoState extends State<UrlLauncherDemo> {
  final TextEditingController urlController = TextEditingController();
  String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  launchUrl(Uri.parse('http://www.pub.dev'));
                  setState(() {});
                },
                child: const Text('Url Launcher'),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: urlController,
                onChanged: (value) {
                  setState(() {
                    url = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Url',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
