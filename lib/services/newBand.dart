import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';
import 'package:resomate/models/bandinfo.dart';

Future<int> addAssignmentToDB(
  String bandName,
  String bandLogoURL,
  String description,
  String bandGenre,
  String bandMemberNo,
  String bandPlace,
  String instrument,
) async {
  int statusCode = 1;

  //create a new user
  Map<String, dynamic> assignmentDetails = new Map();

  var uuid = Uuid();
  var bandInfoID = uuid.v1();
  assignmentDetails.addAll({
    'bandName': bandName,
    'description': description,
    'bandLogoURL': bandLogoURL,
    'bandInfoID': bandInfoID,
    'bandGenre': bandGenre,
    'bandMemberNo': bandMemberNo,
    'bandPlace': bandPlace,
    'instrument': instrument,
  });

  await Firestore.instance
      .collection('bands')
      .document(bandInfoID)
      .setData(assignmentDetails)
      .catchError((onError) {
    statusCode = 3;
  });

  return statusCode;
}

Future<int> editAssignmentinDB(
  String bandInfoID, {
  String description,
  String bandLogoURL,
  String bandName,
  String bandGenre,
  String bandMemberNo,
  String bandPlace,
  String instrument,
}) async {
  int statusCode = 1;

  Map<String, dynamic> assignmentDetails = new Map();

  assignmentDetails.addAll({
    'bandname': bandName,
    'description': description,
    'bandlogo': bandLogoURL,
    'bandInfoID': bandInfoID,
    'bandGenre': bandGenre,
    'bandMemberNo': bandMemberNo,
    'bandPlace': bandPlace,
    'instrument': instrument,
  });

  await Firestore.instance
      .collection('bands')
      .document(bandInfoID)
      .updateData(assignmentDetails)
      .catchError((onError) {
    statusCode = 3;
    print(onError);
  });

  return statusCode;
}

Future<int> deleteAssignmentfromDB(String bandInfoID,
    {String classcode}) async {
  int statusCode = 1;
  print(classcode);
  print("Attempting Delete");
  await Firestore.instance
      .collection('bands')
      .document(bandInfoID)
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
