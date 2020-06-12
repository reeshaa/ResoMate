import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:resomate/models/bandinfo.dart';
import 'package:resomate/models/bandinfowidget.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:resomate/screens/commonpage.dart';

class Bandpressed extends StatefulWidget {
  final BandInfo bandInfo;
  Bandpressed({@required this.bandInfo});
  @override
  _BandpressedState createState() => _BandpressedState();
}

class _BandpressedState extends State<Bandpressed> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(overflow: Overflow.clip, children: <Widget>[
          Positioned(
            // bottom: 500,
            bottom: size.height * 0.69,
            // // right: 700,
            right: -1150,

            child: Image.asset(
              'assets/circle-cropped.png',
            ),
          ),
          Align(
            alignment: Alignment(-0.95, -0.9),
            child: IconButton(
                icon: Icon(
                  FontAwesome.arrow_left,
                  // Icons.arrow_back_ios,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CommonPage()),
                  );
                }),
          ),
          Align(
            alignment: Alignment(0, -0.7),
            child: CircleAvatar(
              maxRadius: size.width * .2,
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSUsZzX75YWPYoBFB_Q-6vloVVYPDhDYiY7AsN8-NSHLcGmToFN&usqp=CAU'),
            ),
          ),
          Align(
            alignment: Alignment(0, -.25),
            child: Text(
              "BAND NAME",
              style: TextStyle(
                  fontSize: size.width * 0.08, fontWeight: FontWeight.w700),
            ),
          ),
          Align(
            alignment: Alignment(0, -.16),
            child: Text("genre",
                style: TextStyle(
                  fontSize: size.width * 0.04,
                  color: Colors.grey,
                )),
          ),
          Align(
            alignment: Alignment(0, 0.25),
            child: Container(
              height: size.height / 3.5,
              width: size.width * 0.9,
              child: Card(
                  elevation: 10,
                  child: Center(
                      child: Text(
                    'some shitty ass\nlong\nbio',
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                    ),
                  ))),
            ),
          ),
          Align(
              alignment: Alignment(-.7, 0.6),
              child: Text("Whom to contact?",
                  style: TextStyle(
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.w600))),
          Align(
              alignment: Alignment(-.75, 0.7),
              child: Text("Name of that person",
                  style: TextStyle(fontSize: size.width * 0.05))),
          Align(
            alignment: Alignment(0.82, 0.7),
            child: SocialMediaButton.whatsapp(
              size: size.width * 0.18,
              color: Colors.green[400],
              url:
                  "https://wa.me/?text=I'm%20inquiring%20about%20the%20band%20member%20listing",
              onTap: () {
                print('onTap ');
              },
            ),
          ),
          Align(
            alignment: Alignment(0, 0.95),
            child: SocialMediaButton.twitter(
              url: "https://twitter.com/",
              size: size.width * 0.09,
              color: Colors.blue,
            ),
          ),
          Align(
            alignment: Alignment(-0.3, 0.95),
            child: SocialMediaButton.instagram(
              size: size.width * 0.09,
              color: Colors.pink,
              url: "https://www.instagram.com/",
              onTap: () {
                print('onTap ');
              },
            ),
          ),
          Align(
            alignment: Alignment(0.3, 0.95),
            child: SocialMediaButton.spotify(
              color: Colors.lightGreen[900],
              size: size.width * 0.09,
              url: "https://www.spotify.com/",
              onTap: () {
                print('onTap ');
              },
            ),
          ),
          Align(
            alignment: Alignment(0.6, 0.95),
            child: SocialMediaButton.youtube(
              color: Colors.redAccent[700],
              size: size.width * 0.09,
              url: "https://youtube.com/",
              onTap: () {
                print('onTap ');
              },
            ),
          ),
          Align(
            alignment: Alignment(-0.6, 0.95),
            child: SocialMediaButton.facebook(
              color: Colors.blue,
              size: size.width * 0.09,
              url: "https://facebook.com/",
              onTap: () {
                print('onTap ');
              },
            ),
          ),
        ]));
  }
}
