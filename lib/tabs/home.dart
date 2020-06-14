import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resomate/models/bandinfo.dart';
import 'package:resomate/models/bandinfowidget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('bands').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<BandInfo> currentAssignments = snapshot.data.documents
                  .map((doc) => BandInfo.fromJson(doc))
                  .toList();

              if (currentAssignments.length == 0)
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.assignment_turned_in,
                        size: 80,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 35),
                      Text('No bands yet',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                );

              return CustomScrollView(
                slivers: <Widget>[
//
// //
                  // SliverList(
                  //     delegate: SliverChildListDelegate([
                  //   SliverToBoxAdapter(
                  //     child: Container(
                  //         height: 50,
                  //         padding: EdgeInsets.all(20),
                  //         child: Text("Categories",
                  //             textAlign: TextAlign.left,
                  //             style: TextStyle(
                  //                 fontSize: 32,
                  //                 fontWeight: FontWeight.w600))),
                  //   )
                  // ])),

// //
//
                  SliverList(delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    if (index > currentAssignments.length - 1) return null;
                    return Column(
                      children: <Widget>[
                        PostCard(
                          bandInfo: currentAssignments[index],
                        ),
                        SizedBox(height: 0.5),
                      ],
                    );
                  })),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
