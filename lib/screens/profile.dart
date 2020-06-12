import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String text = 'bleh';
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              // SizedBox(width: 3),
              Column(
                children: <Widget>[
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      maxRadius: size.width * .18,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSUsZzX75YWPYoBFB_Q-6vloVVYPDhDYiY7AsN8-NSHLcGmToFN&usqp=CAU'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("genre",
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          color: Colors.grey,
                        )),
                  ),
                ],
              ),
              // SizedBox(width: ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "MY NAME",
                    style: TextStyle(
                        fontSize: size.width * 0.078,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    width: size.width * 0.5,
                    child: Text(
                      "what happens if i write a really long ass messege does it go out or does it fill within ",
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 30,
            thickness: 1.5,
          ),
          Text(
            "Instrument",
            style: TextStyle(
              fontSize: size.width * 0.065,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '$text',
            style: TextStyle(
              fontSize: size.width * 0.045,
            ),
          ),
          Divider(),
          Text(
            "Place",
            style: TextStyle(
              fontSize: size.width * 0.065,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '$text',
            style: TextStyle(
              fontSize: size.width * 0.05,
            ),
          ),
          Divider(),
          Text(
            "Age",
            style: TextStyle(
              fontSize: size.width * 0.065,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '$text',
            style: TextStyle(
              fontSize: size.width * 0.05,
            ),
          ),
          Divider(),
          Text(
            "Experience",
            style: TextStyle(
              fontSize: size.width * 0.065,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: size.width * 0.8,
            child: Text(
              'writing a long ass messege to see if it fills in, please dont go out i am tired and i cant do anymore',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width * 0.05,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
