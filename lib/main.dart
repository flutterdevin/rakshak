import 'package:flutter/material.dart';
import 'package:rakshak/shake_detector.dart';
import 'package:rakshak/screens/sos_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SOSScreen(),
    );
  }
}

/*
Scaffold(
        appBar: AppBar(
          title: Text(
            'Rakshak',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black54,
        body: SafeArea(
          child: ShakeDetectorScreen(),
        ),
      )
 */
