import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class ShakeDetectorClass {
  void initializeShakeDetector(BuildContext context) {
    int count = 0;
    ShakeDetector.autoStart(
        shakeThresholdGravity: 6.0,
        onPhoneShake: () {
          print(count);
          count++;
          showReportDialog(context);
        });

//    ShakeDetector.waitForStart(onPhoneShake: () {
//      print("Shake waitForStart");
//    });
  }

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
}
