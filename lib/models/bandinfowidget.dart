import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'dart:typed_data';

import 'package:resomate/models/bandinfo.dart';

class PostCard extends StatefulWidget {
  final BandInfo bandInfo;
  PostCard({@required this.bandInfo});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  final String profiledefault =
      'https://firebasestorage.googleapis.com/v0/b/instaclone-63929.appspot.com/o/Deafult-Profile-Picture.png?alt=media&token=9a731929-a94c-4ce9-b77c-db317fa6148e';

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color dynamiciconcolor = (!isDarkMode) ? Colors.black54 : Colors.white70;
    Color dynamicuicolor =
        (!isDarkMode) ? new Color(0xfff8faf8) : Color.fromRGBO(35, 35, 35, 1.0);
    return Container(
      padding: EdgeInsets.all(2),
      height: 170,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: (!isDarkMode) ? Colors.white : Colors.black,
          elevation: 5.0,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      maxRadius: 50,
                      backgroundImage:
                          NetworkImage(widget.bandInfo.bandLogoURL),
                    ),
                    Text(
                      '${widget.bandInfo.bandGenre}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.bandInfo.bandName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32)),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
