import 'package:flutter/material.dart';
// import 'package:resomate/models/pinfo.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

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
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRVWA1Rc3wZi6xxQaBfv8h0S1kQYXx01xAv6it_TuBoY0P3j21u&usqp=CAU',
                            ))),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Indie",
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
                      // snapshot.data.documents[0]['pname'],
                      'Taylor Swift',
                      style: TextStyle(
                          fontSize: size.width * 0.078,
                          fontWeight: FontWeight.w700),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: size.width * 0.5,
                      child: Text(
                        "Keeping it Original",
                        style: TextStyle(
                            fontSize: size.width * 0.045,
                            color: Colors.grey[700],
                            fontStyle: FontStyle.italic),
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
            SizedBox(height: 20),
            Text(
              "Instrument",
              style: TextStyle(
                fontSize: size.width * 0.065,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Keyboard',
              style: TextStyle(
                  fontSize: size.width * 0.045, color: Colors.grey[700]),
            ),
            Divider(),
            Text(
              "Place",
              style: TextStyle(
                fontSize: size.width * 0.065,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Bangalore',
              style: TextStyle(
                  fontSize: size.width * 0.05, color: Colors.grey[700]),
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
              '20',
              style: TextStyle(
                  fontSize: size.width * 0.05, color: Colors.grey[700]),
            ),
            Divider(),
            Text(
              "Experience",
              style: TextStyle(
                fontSize: size.width * 0.065,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: size.width * 0.8,
              child: Text(
                'A huge fan of the Phalanges.\n Have been singing before I learned to walk, I play the guitar, Ukelele, and learning drums.\nI wish to make a career in music.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: size.width * 0.045, color: Colors.grey[700]),
              ),
            ),
          ],
        ));
  }
}
