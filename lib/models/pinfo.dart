import 'package:cloud_firestore/cloud_firestore.dart';

class PersonInfo {
  final String pName;
  final String pDp;
  final String pInfoID;
  final String pGenre;
  final String pPlace;
  final String pInstrument;
  final String pPhone;
  final String pExperience;
  final String pAge;
  final String pBio;

  PersonInfo(
    this.pName,
    this.pAge,
    this.pBio,
    this.pDp,
    this.pExperience,
    this.pGenre,
    this.pInfoID,
    this.pInstrument,
    this.pPhone,
    this.pPlace,
  );

  factory PersonInfo.fromJson(dynamic json) {
    return PersonInfo(
      json['pName'],
      json['pDp'],
      json['pInfoID'],
      json['pGenre'],
      json['pPlace'],
      json['pInstrument'],
      json['pPhone'],
      json['pExperience'],
      json['pAge'],
      json['pBio'],
    );
  }
}
