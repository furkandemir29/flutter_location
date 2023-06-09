import 'package:location/models/POut.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../models/LocationModel.dart';
part 'RestClient.g.dart';





@RestApi(baseUrl:"http://13.80.244.188/ccms_mobil_api_pilot/")
abstract class RestClient{
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('api/v1/Mobil/Log/CihazLog')
  Future<POut> uploadFilesToS3(List<LocationModel>? location);

}
