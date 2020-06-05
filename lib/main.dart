import 'package:flutter/material.dart';
import 'package:resomate/screens/detail.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BandSolo(),
      ),
    );
  }
}

class BandSolo extends StatefulWidget {
  @override
  _BandSoloState createState() => _BandSoloState();
}

class _BandSoloState extends State<BandSolo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ResoMate',
      color: Colors.white,
      home: Scaffold(
        body: SafeArea(
            child: Container(
                child: Center(
          child: Stack(children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 60,
                    width: 200,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      color: Colors.deepPurpleAccent,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Detail()));
                      },
                      child: Text("Join a Band",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    )),
                SizedBox(height: 65),
                Container(
                    height: 60,
                    width: 200,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      color: Colors.deepPurpleAccent,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Detail()),
                        );
                      },
                      child: Text("Find a Homie",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    )),
              ],
            ),
          ]),
        ))),
      ),
    );
  }
}
