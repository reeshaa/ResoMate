import 'package:cloud_firestore/cloud_firestore.dart';

class BandInfo {
  final String description;
  final String bandLogoURL;
  final String bandName;
  final String bandInfoID;
  final String bandGenre;

  BandInfo(this.description, this.bandLogoURL, this.bandName, this.bandInfoID,
      this.bandGenre);

  factory BandInfo.fromJson(dynamic json) {
    return BandInfo(
      json['description'],
      json['bandLogoURL'],
      json['bandName'],
      json['bandInfoID'],
      json['bandGenre'],
    );
  }
}
