import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:intl/intl.dart';
import 'package:resomate/services/newBand.dart';

class AddAssignment extends StatefulWidget {
  final String classcode;
  AddAssignment({Key key, this.classcode}) : super(key: key);

  @override
  _AddAssignmentState createState() => _AddAssignmentState();
}

class _AddAssignmentState extends State<AddAssignment> {
  bool isLoading = false;
  bool showLoading = true;
  TextEditingController _titlecontroller,
      _descriptioncontroller,
      _subjectcodecontroller,
      _moredetailslinkcontroller,
      // _submissionlinkcontroller,
      _membercountcontroller,
      _placecontroller,
      _instrumentcontroller;
  final _formKey = GlobalKey<FormState>();
  String description;
  String bandLogoURL;
  String bandName;
  String bandInfoID;
  String bandGenre;
  String bandMemberNo;
  String bandPlace;
  String instrument;

  @override
  void initState() {
    super.initState();
    this._titlecontroller = new TextEditingController();
    this._descriptioncontroller = new TextEditingController();
    this._moredetailslinkcontroller = new TextEditingController();
    this._subjectcodecontroller = new TextEditingController();
    // this._submissionlinkcontroller = new TextEditingController();
    this._membercountcontroller = new TextEditingController();
    this._placecontroller = new TextEditingController();
    this._instrumentcontroller = new TextEditingController();
  }

  onPressRegister() {
    if (!_formKey.currentState.validate()) {
    } else {
      setState(() {
        this.isLoading = true;
      });
      addAssignmentToDB(
        _titlecontroller?.text ?? "Untitled",
        _subjectcodecontroller?.text ?? "NESC",
        _descriptioncontroller?.text ?? "Band Description",
        _moredetailslinkcontroller?.text ?? "Band Genre",
        _membercountcontroller?.text ?? "Band Members",
        _placecontroller?.text ?? "Place",
        _instrumentcontroller?.text ?? "Instrument",
      ).then((statusCode) {
        setState(() {
          this.isLoading = false;
        });
        switch (statusCode) {
          case 1:
            print('Added');
            Fluttertoast.showToast(
                msg: "Band Added",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.pop(context);
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

  Widget _entryField(String title,
      {TextEditingController controllervar, bool isRequired = true}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
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

  Widget _descriptionField(String title,
      {TextEditingController controllervar}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please fill in this field';
                }
                return null;
              },
              keyboardType: TextInputType.multiline,
              maxLines: 18,
              controller: controllervar,
              decoration:
                  InputDecoration(border: InputBorder.none, filled: true))
        ],
      ),
    );
  }

  Widget _formfieldswidgets() {
    return Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            _entryField("Title", controllervar: _titlecontroller),
            _entryField("Image URL",
                controllervar: _subjectcodecontroller, isRequired: false),
            _descriptionField("Description",
                controllervar: _descriptioncontroller),
            _entryField("Band Genre",
                controllervar: _moredetailslinkcontroller, isRequired: false),
            _entryField("Place",
                controllervar: _placecontroller, isRequired: true),
            _entryField("Member Count",
                controllervar: _membercountcontroller, isRequired: true),
            _entryField("Instrument",
                controllervar: _instrumentcontroller, isRequired: true),
          ],
          physics: BouncingScrollPhysics(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Band'),
        actions: <Widget>[
          FlatButton(
            child: isLoading
                ? CupertinoActivityIndicator()
                : Text('ADD',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
            onPressed: () {
              onPressRegister();
            },
          )
        ],
      ),
      body: Center(
        child:
            Padding(padding: EdgeInsets.all(10), child: _formfieldswidgets()),
      ),
    );
  }
}
