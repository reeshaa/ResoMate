import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:jumping_bottom_nav_bar/jumping_bottom_nav_bar.dart';
import 'package:resomate/screens/addinfo.dart';
import 'package:resomate/screens/profile.dart';
import 'package:resomate/screens/home.dart';
import 'package:resomate/screens/drawerwidget.dart';
// import 'package:flutter_icons/flutter_icons.dart';

class CommonPage extends StatefulWidget {
  @override
  _CommonPageState createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage> {
  int selectedIndex = 2;
  final iconList = [
    TabItemIcon(
        iconData: Icons.audiotrack,
        startColor: Colors.white,
        curveColor: Colors.white),
    TabItemIcon(
        iconData: Icons.home,
        curveColor: Colors.white,
        startColor: Colors.white),
    TabItemIcon(
        iconData: Icons.account_circle,
        curveColor: Colors.white,
        startColor: Colors.white)
  ];
  void onChangeTab(int index) {
    selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 1,
        length: iconList.length,
        child: Scaffold(
          // backgroundColor: Colors.pink[400],
          backgroundColor: Colors.deepPurpleAccent[100],
          appBar: AppBar(
              elevation: 10,
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddAssignment()));
                    })
              ],
              flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                    // Colors.indigo[900],
                    // Colors.blue
                    // // Colors.indigo,
                    Colors.deepPurple,
                    Colors.purpleAccent[700],

                    // Colors.deepPurple, original
                    // Colors.pink[900] og
                    // Colors.pink[600]
                  ]))),
              title: Text(
                "ResoMate",
                style: TextStyle(fontSize: 24),
              )),
          drawer: Drawer(child: SafeArea(child: DrawerWidget())),
          body: Container(
            child: TabBarView(
              children: [
                Container(
                    color: Colors.white,
                    child: Center(child: Text("Favourites to be added here"))),
                Home(),
                Profile(),
              ],
            ),
          ),
          bottomNavigationBar: JumpingTabBar(
            duration: Duration(milliseconds: 1600),
            onChangeTab: onChangeTab,
            circleGradient: LinearGradient(colors: [
              Colors.purpleAccent,
              Colors.deepPurple,
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
            items: iconList,
            selectedIndex: selectedIndex,
          ),
        ),
      ),
    );
  }
}
