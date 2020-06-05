import 'package:cloud_firestore/cloud_firestore.dart';

class BandInfo {
  final String description;
  final String bandLogoURL;
  final String bandName;
  final String bandInfoID;

  BandInfo(
    this.description,
    this.bandLogoURL,
    this.bandName,
    this.bandInfoID,
  );

  factory BandInfo.fromJson(dynamic json) {
    return BandInfo(
      json['description'],
      json['bandLogoURL'],
      json['bandName'],
      json['bandInfoID'],
    );
  }
}
