import 'package:flutter/material.dart';
import 'package:waterspring/pages/locationSelected.dart';
import 'package:waterspring/pages/polygon.dart';
import 'package:waterspring/pages/slidingUP.dart';
// import 'package:waterspring/pages/stepper.dart';

// C:\Users\ASUS\AppData\Local\Android\Sdk\platform-tools
// adb connect localhost:[port-bluestack]
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SlidingUP(),
    );
  }
}
