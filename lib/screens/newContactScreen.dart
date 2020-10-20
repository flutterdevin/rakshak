import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class newContact extends StatefulWidget {
  static const String id = 'newContact';
  @override
  _newContactState createState() => _newContactState();
}

class _newContactState extends State<newContact> {
  List<String> people = [];
  TextEditingController _controllerPeople = new TextEditingController();
  TextEditingController _controllermsg = new TextEditingController();
  String msg = null;

  Widget _phoneTile(String name) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.grey[300]),
            top: BorderSide(color: Colors.grey[300]),
            left: BorderSide(color: Colors.grey[300]),
            right: BorderSide(color: Colors.grey[300]),
          )),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => setState(() => people.remove(name)),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    name,
                    textScaleFactor: 1.0,
                    style: TextStyle(fontSize: 12.0),
                  ),
                )
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(
          title: const Text('Add Contacts and Message'),
          backgroundColor: Colors.black45,
        ),
        body: ListView(
          children: <Widget>[
            people == null || people.isEmpty
                ? Container(
                    height: 0.0,
                  )
                : Container(
                    height: 90.0,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:
                            List<Widget>.generate(people.length, (int index) {
                          return _phoneTile(people[index]);
                        }),
                      ),
                    ),
                  ),
            ListTile(
              leading: Icon(Icons.people),
              title: TextField(
                controller: _controllerPeople,
                decoration: InputDecoration(labelText: "Add Phone Number"),
                keyboardType: TextInputType.number,
                onChanged: (String value) => setState(() {}),
              ),
              trailing: IconButton(
                icon: Icon(Icons.add),
                onPressed: _controllerPeople.text.isEmpty
                    ? null
                    : () => setState(() {
                          people.add(_controllerPeople.text.toString());
                          _controllerPeople.clear();
                          print(people);
                        }),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.message),
              title: TextField(
                decoration: InputDecoration(labelText: " Add Message"),
                controller: _controllermsg,
                onChanged: (String value) => setState(() {
                  msg = _controllermsg.text;
                  print(msg);
                }),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: FlatButton(
                textColor: Colors.white,
                padding: EdgeInsets.all(12),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('BACK',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                color: Colors.teal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
