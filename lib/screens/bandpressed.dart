import 'package:flutter/material.dart';

class Bandpressed extends StatefulWidget {
  @override
  _BandpressedState createState() => _BandpressedState();
}

class _BandpressedState extends State<Bandpressed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.white,
            child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.amber,
            )),
      ),
    );
  }
}
