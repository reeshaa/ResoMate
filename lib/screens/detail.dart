import 'package:flutter/material.dart';
import 'package:resomate/tabs/commonpage.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("DIRECT ACCESS"),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommonPage()),
                  );
                },
                child: Text("login"),
              )
            ],
          )),
        ),
      ),
    );
  }
}
