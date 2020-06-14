import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/services.dart';
// import 'dart:convert';
// import 'dart:async';
// import 'dart:io';
import 'package:flutter/foundation.dart';
// import 'dart:typed_data';
import 'package:resomate/screens/bandpressed.dart';
import 'package:resomate/models/bandinfo.dart';

class PostCard extends StatefulWidget {
  final BandInfo bandInfo;
  PostCard({@required this.bandInfo});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // Color dynamiciconcolor = (!isDarkMode) ? Colors.black54 : Colors.white70;
    // Color dynamicuicolor =
    //     (!isDarkMode) ? new Color(0xfff8faf8) : Color.fromRGBO(35, 35, 35, 1.0);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Bandpressed(bandInfo: widget.bandInfo)));
      },
      hoverColor: Colors.blueAccent,
      splashColor: Colors.purple,
      child: Container(
        padding: EdgeInsets.all(1.5),
        height: size.height * 0.19,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // color: (!isDarkMode) ? Colors.white : Colors.black,
            elevation: 4,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 2, 2, 1),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(width: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        maxRadius: size.height * 0.06,
                        backgroundImage:
                            NetworkImage(widget.bandInfo.bandLogoURL),
                      ),
                      SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('${widget.bandInfo.bandGenre}',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Container(
                    width: size.width * 0.62,
                    padding: EdgeInsets.all(2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(widget.bandInfo.bandName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 0.07)),
                            SizedBox(width: 25),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                                "No. of band members : ${widget.bandInfo.bandMemberNo}\nLocation  : ${widget.bandInfo.bandPlace}\n",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey)),
                            Text("Looking for ${widget.bandInfo.instrument}",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
