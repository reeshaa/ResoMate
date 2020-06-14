import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:resomate/models/bandinfo.dart';
// import 'package:resomate/models/bandinfowidget.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:resomate/tabs/commonpage.dart';

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
                  'https://i.ytimg.com/vi/T_u_qFNBgn0/maxresdefault.jpg'),
              // 'https://lh3.googleusercontent.com/proxy/FGXwZxR05Fauzc5ehTOIc4IsCrjlM65sZXg0OBfEDWZXOh3JWSglW06N7b-wqo1-PovP1LGDL3iv2dUkwoMbU9Df3PimFFqNdFcyHrM5mkX9CMzNEKA4pMeJORX6yNbsuEDsV16ZFJp2J1dtavtAzrUOlm6sIWnB5iKeBB59Qrmec_EOR5qYZ-Rb'),
            ),
          ),
          Align(
            alignment: Alignment(0, -.26),
            child: Text(
              "PHALANGES",
              style: TextStyle(
                  fontSize: size.width * 0.08, fontWeight: FontWeight.w700),
            ),
          ),
          Align(
            alignment: Alignment(0, -.16),
            child: Text("Indie",
                style: TextStyle(
                  fontSize: size.width * 0.04,
                  color: Colors.grey,
                )),
          ),
          Align(
            alignment: Alignment(0, 0.25),
            child: Container(
              // padding: EdgeInsets.all(2),
              height: size.height / 3.5,
              width: size.width * 0.9,
              child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Center(
                        child: Text(
                      "A band popular in the industry since the '90s. Popular for 'Smelly Cat' cover.\n\nThe band consists of people from the age of 35 to the age of 16.\nLooking for a female vocalist.\nLocation doesn't matter as we are planning of making a cover by online medium.",
                      style: TextStyle(
                          fontSize: size.width * 0.045,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    )),
                  )),
            ),
          ),
          Align(
              alignment: Alignment(-.7, 0.6),
              child: Text("Whom to contact?",
                  style: TextStyle(
                      fontSize: size.width * 0.07,
                      fontWeight: FontWeight.w600))),
          Align(
              alignment: Alignment(-.8, 0.72),
              child: RichText(
                text: TextSpan(
                    text: "Phoebe Buffay\n",
                    style: TextStyle(
                        fontSize: size.width * 0.05, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Lead Artist',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: size.width * 0.04,
                              color: Colors.grey[700]))
                    ]),
              )),
          Align(
            alignment: Alignment(0.82, 0.7),
            child: SocialMediaButton.whatsapp(
              size: size.width * 0.18,
              color: Colors.green[400],
              url:
                  "https://wa.me/919148116316?text=I'm%20a%20user%20from%20ResoMate\nI%20saw%20your%20team%20on%20the%20app.%20\n\nHere%20are%20my%20details-%20\nName%20%20:%20Taylor%20Swift%20\nAge%20%20:%2020\nLocation%20%20:%20Bangalore%20%20%20\n\nI%20am%20applying%20for%20the%20position%20of%20FEMALE%20VOCALIST\n\n\n//custom%20messege%20here",
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
