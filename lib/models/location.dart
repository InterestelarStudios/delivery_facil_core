import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Location {

  String? locality;
  String? address;
  GeoPoint? geoPoint;
  Location({
    this.locality,
    this.address,
    this.geoPoint,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'locality': locality,
      'address': address,
      'geoPoint': geoPoint,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      locality: map['locality'] != null ? map['locality'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      geoPoint: map['geoPoint'] != null ? map['geoPoint'] as GeoPoint : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Location.fromJson(String source) => Location.fromMap(json.decode(source) as Map<String, dynamic>);
}