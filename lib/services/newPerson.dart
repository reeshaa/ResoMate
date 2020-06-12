import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:resomate/models/pinfo.dart';

Future<int> addPersonToDB(
  String pName,
  String pDp,
  String pInfoID,
  String pGenre,
  String pPlace,
  String pInstrument,
  String pPhone,
  String pExperience,
  String pAge,
  String pBio,
) async {
  int statusCode = 1;

  //create a new user
  Map<String, dynamic> personDetails = new Map();

  var uuid = Uuid();
  var pInfoID = uuid.v1();
  personDetails.addAll({
    'pName': pName,
    'pDp': pDp,
    'pInfoID': pInfoID,
    'pGenre': pGenre,
    'pPlace': pPlace,
    'pInstrument': pInstrument,
    'pPhone': pPhone,
    'pAge': pAge,
    'pBio': pBio,
    'pExperience': pExperience,
  });

  await Firestore.instance
      .collection('personal information')
      .document(pInfoID)
      .setData(personDetails)
      .catchError((onError) {
    statusCode = 3;
  });

  return statusCode;
}

Future<int> editPersoninDB(
  String pInfoID, {
  String pName,
  String pDp,
  String pGenre,
  String pPlace,
  String pInstrument,
  String pPhone,
  String pExperience,
  String pAge,
  String pBio,
}) async {
  int statusCode = 1;

  Map<String, dynamic> personDetails = new Map();

  personDetails.addAll({
    'pName': pName,
    'pDp': pDp,
    'pInfoID': pInfoID,
    'pGenre': pGenre,
    'pPlace': pPlace,
    'pInstrument': pInstrument,
    'pPhone': pPhone,
    'pAge': pAge,
    'pBio': pBio,
    'pExperience': pExperience,
  });

  await Firestore.instance
      .collection('personal information')
      .document(pInfoID)
      .updateData(personDetails)
      .catchError((onError) {
    statusCode = 3;
    print(onError);
  });

  return statusCode;
}

Future<int> deletePersonfromDB(String pInfoID, {String personcode}) async {
  int statusCode = 1;
  print(personcode);
  print("Attempting Delete");
  await Firestore.instance
      .collection('personal information')
      .document(pInfoID)
      .delete()
      .catchError((onError) {
    statusCode = 3;
    print(onError);
  });

  return statusCode;
}

Future<FirebaseUser> getUser() async {
  return await FirebaseAuth.instance.currentUser();
}
