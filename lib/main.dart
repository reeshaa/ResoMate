import 'package:flutter/material.dart';
import 'package:resomate/screens/detail.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BandSolo(),
      ),
    );
  }
}

class BandSolo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Container(
              child: Center(
        child: Stack(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: Image.asset(
                  'assets/entertainment (1).png',
                  width: size.width * 0.7,
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(height: size.height * 0.06),
              Container(
                  height: size.height * 0.075,
                  width: size.width * 0.65,
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
              SizedBox(height: size.height * 0.035),
              Container(
                  height: size.height * 0.075,
                  width: size.width * 0.65,
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
    );
  }
}
