import 'package:json_annotation/json_annotation.dart';


class LocationModel {

  final String? lat;
  final String? long;

  const LocationModel({required this.lat, required this.long});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      LocationModel(

          lat: json['lat'],
          long: json['long']
      );


  Map<String, dynamic> toJson() =>
      {
        "lat": lat,
        "long": long
      };

}


