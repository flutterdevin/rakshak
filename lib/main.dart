import 'package:flutter/material.dart';

import 'package:rakshak/screens/sos_screen.dart';
import 'package:rakshak/screens/newContactScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: SOSScreen.id,
      routes: {
        SOSScreen.id: (context) => SOSScreen(),
        newContact.id: (context) => newContact(),
      },
    );
  }
}
