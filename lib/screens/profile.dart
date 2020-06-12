import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Container(
                padding: EdgeInsets.fromLTRB(3, 10, 3, 2),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      maxRadius: size.width * .16,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSUsZzX75YWPYoBFB_Q-6vloVVYPDhDYiY7AsN8-NSHLcGmToFN&usqp=CAU'),
                    ),
                    Text("DO PROFILE PAGE"),
                  ],
                ))));
  }
}
