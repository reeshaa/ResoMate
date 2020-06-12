import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';
import 'package:resomate/screens/commonpage.dart';
// import 'package:resomate/screens/detail.dart';
import 'package:resomate/services/newPerson.dart';

class PersonalInfo extends StatefulWidget {
  final String personcode;
  PersonalInfo({Key key, this.personcode}) : super(key: key);
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  bool isLoading = false;
  bool showLoading = true;
  TextEditingController _titlecontroller,
      _pnamecontroller,
      _pplacecontroller,
      _pagecontroller,
      _pbiocontroller,
      _pinstrumentcontroller,
      _pgenrecontroller,
      _pdpcontroller,
      _pphonecontroller,
      _pexperience;

  final _pformkey = GlobalKey<FormState>();
  String pName;
  String pDp;
  String pInfoID;
  String pGenre;
  String pPlace;
  String pInstrument;
  String pPhone;
  String pExperience;
  String pAge;
  String pBio;

  @override
  void initState() {
    super.initState();
    this._titlecontroller = new TextEditingController();
    this._pnamecontroller = new TextEditingController();
    this._pplacecontroller = new TextEditingController();
    this._pagecontroller = new TextEditingController();
    this._pbiocontroller = new TextEditingController();
    this._pinstrumentcontroller = new TextEditingController();
    this._pgenrecontroller = new TextEditingController();
    this._pdpcontroller = new TextEditingController();
    this._pphonecontroller = new TextEditingController();
    this._pexperience = new TextEditingController();
  }

  onPressRegister() {
    if (!_pformkey.currentState.validate()) {
    } else {
      setState(() {
        this.isLoading = true;
      });
      addPersonToDB(
        _titlecontroller?.text ?? "Untitled",
        _pnamecontroller?.text ?? "Name",
        _pdpcontroller?.text ?? "Default Picture",
        _pgenrecontroller?.text ?? "Genre",
        _pplacecontroller?.text ?? "Place",
        _pinstrumentcontroller?.text ?? "Instrument",
        _pphonecontroller?.text ?? "Phone Number",
        _pexperience?.text ?? "Experience",
        _pagecontroller?.text ?? "Age",
        _pbiocontroller?.text ?? "Bio",
      ).then((statusCode) {
        setState(() {
          this.isLoading = false;
        });

        switch (statusCode) {
          case 1:
            print('Added');
            Fluttertoast.showToast(
                msg: "Details submitted",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                textColor: Colors.white,
                fontSize: 16.0);
            // Navigator.pop(context);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => CommonPage()));
            break;
          case 2:
            print('check your internet connection');
            Fluttertoast.showToast(
                msg: "Check your Internet Connection",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                textColor: Colors.white,
                fontSize: 16.0);
            break;
          case 3:
            print('please try again later');
            Fluttertoast.showToast(
                msg: "Please try again later",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                textColor: Colors.white,
                fontSize: 16.0);
            break;
        }
      });
    }
  }

  Widget _pentryField(String title,
      {TextEditingController controllervar, bool isRequired = true}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          SizedBox(height: 10),
          TextFormField(
              validator: (value) {
                if (isRequired && value.isEmpty) {
                  return 'Please fill in this field';
                }
                return null;
              },
              controller: controllervar,
              decoration:
                  InputDecoration(border: InputBorder.none, filled: true))
        ],
      ),
    );
  }

  Widget _pdescriptionField(String title,
      {TextEditingController controllervar}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          SizedBox(height: 10),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please fill in this field';
                }
                return null;
              },
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              controller: controllervar,
              decoration:
                  InputDecoration(border: InputBorder.none, filled: true))
        ],
      ),
    );
  }

  Widget _pformfieldswidgets() {
    return Form(
        key: _pformkey,
        child: ListView(
          children: <Widget>[
            _pentryField("Name",
                controllervar: _pnamecontroller, isRequired: true),
            _pentryField("Place",
                controllervar: _pplacecontroller, isRequired: true),
            _pentryField("Age", controllervar: _pagecontroller),
            _pdescriptionField("Bio", controllervar: _pbiocontroller),
            _pentryField("Instrument",
                controllervar: _pinstrumentcontroller, isRequired: true),
            _pentryField("Genre",
                controllervar: _pgenrecontroller, isRequired: true),
            _pentryField("Phone Number",
                controllervar: _pphonecontroller, isRequired: true),
            _pdescriptionField("Experience", controllervar: _pexperience),
            SizedBox(height: 40),
            Container(
              height: MediaQuery.of(context).size.height * 0.075,
              width: MediaQuery.of(context).size.width * 0.5,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.purple,
                child: isLoading
                    ? CupertinoActivityIndicator()
                    : Text('Login',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                onPressed: () {
                  onPressRegister();
                },
              ),
            )
          ],
          physics: BouncingScrollPhysics(),
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join a Band'),
        flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
              // Colors.purpleAccent,
              Colors.deepPurple,
              // Colors.pink[400],
              Colors.pink[900]
            ]))),
      ),
      body: Center(
        child:
            Padding(padding: EdgeInsets.all(10), child: _pformfieldswidgets()),
      ),
    );
  }
}
