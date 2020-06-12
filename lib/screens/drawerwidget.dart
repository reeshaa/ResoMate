import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Text("Sorry, Still under Development",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                  textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}
