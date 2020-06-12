// import 'package:cloud_firestore/cloud_firestore.dart';

class BandInfo {
  final String description;
  final String bandLogoURL;
  final String bandName;
  final String bandInfoID;
  final String bandGenre;
  final String bandMemberNo;
  final String bandPlace;
  final String instrument;

  BandInfo(
    this.description,
    this.bandLogoURL,
    this.bandName,
    this.bandInfoID,
    this.bandGenre,
    this.bandMemberNo,
    this.bandPlace,
    this.instrument,
  );

  factory BandInfo.fromJson(dynamic json) {
    return BandInfo(
      json['description'],
      json['bandLogoURL'],
      json['bandName'],
      json['bandInfoID'],
      json['bandGenre'],
      json['bandMemberNo'],
      json['bandPlace'],
      json['instrument'],
    );
  }
}
