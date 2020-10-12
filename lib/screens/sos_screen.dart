import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:sendsms/sendsms.dart';
import 'package:geolocator/geolocator.dart';

class SOSScreen extends StatefulWidget {
  @override
  _SOSScreenState createState() => _SOSScreenState();
}

class _SOSScreenState extends State<SOSScreen> {
  @override
  void initState() {
    ShakeDetector.autoStart(onPhoneShake: () {
      sseenndd();
    });
    super.initState();
    lat_long();
  }

  void lat_long() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch (e) {
      print(e);
    }
  }

  void sseenndd() async {
    String phoneNumber = "+918340792564";
    String message = "it is a random msg text";
    await Sendsms.onGetPermission();
    setState(() async {
      if (await Sendsms.hasPermission()) {
        await Sendsms.onSendSMS(phoneNumber, message);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD80015),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'RAKSHAK',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 250.0,
              decoration: BoxDecoration(
                color: Color(0xFFFF1423),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFFE71626),
                  width: 20.0,
                ),
              ),
              child: Center(
                child: Container(
                  height: 180.0,
                  width: 180.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFDDDCDC),
                    shape: BoxShape.circle,
                  ),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0)),
                    onPressed: () {
                      print('Alert --- Emergency');
                    },
                    child: Center(
                      child: Text(
                        'SOS',
                        style: TextStyle(
                          color: Color(0xFF777777),
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 80.0,
              width: 170.0,
              decoration: BoxDecoration(
                color: Color(0xFFDDDCDC),
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  color: Color(0xFFE71626),
                  width: 10.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.person_add,
                      size: 35.0,
                      color: Color(0xFF777777),
                    ),
                    onPressed: () {
                      print('Add member');
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      size: 35.0,
                      color: Color(0xFF777777),
                    ),
                    onPressed: () {
                      print('Setting button');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
