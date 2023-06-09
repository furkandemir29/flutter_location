import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:location/models/POut.dart';
import '../models/LocationModel.dart';

class PokeApi{
  static const String _url ='http://13.80.244.188/lol/api/v1/Mobil/Hero/GetHero';

  static Future<POut?> getPokemonData(List<LocationModel> localtionModel) async{
    POut? pOut=null;

    String encoded = jsonDecode(jsonEncode(localtionModel)).toString() ;
   // String deneme = jsonDecode(encoded).toString();

    var result = await Dio().post(_url,data:  encoded);
    var heroList = (result.data)['heros'];


    return pOut;
  }
}