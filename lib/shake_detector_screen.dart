import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class ShakeDetectorScreen extends StatelessWidget {
  void showReportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(title: Text("Do you want to report a problem?"), actions: [
          RaisedButton(
            child: Text("Report"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ShakeDetector.autoStart(
        shakeSlopTimeMS: 1000,
        onPhoneShake: () {
          showReportDialog(context);
        });

    return Scaffold(
      body: Center(
        child: Text(
          "Shake the device...",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
