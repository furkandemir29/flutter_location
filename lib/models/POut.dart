
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class POut {

  final String? kod;
  final String? mesaj;

  const POut({required this.kod, required this.mesaj });


  factory POut .fromJson(Map<String, dynamic> json) =>   POut(
      kod: json['kod'],
      mesaj: json['mesaj']
  );


  Map<String, dynamic> toJson() =>  {
    "kod": kod,
    "mesaj": mesaj
  };

}


