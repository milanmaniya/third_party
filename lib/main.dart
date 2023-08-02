import 'package:flutter/material.dart';
import 'package:third_party/shared_preference/counter_shared.dart';
import 'package:third_party/url%20launcher/url_launcher_demo.dart';
import 'package:third_party/web%20view/web_view_demo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CounterShared.init;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const UrlLauncherDemo(),
    );
  }
}
