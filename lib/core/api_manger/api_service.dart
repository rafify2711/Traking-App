import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tracking_app/core/utils/constants.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_response/apply_response.dart';
import 'package:tracking_app/features/apply/data/models/get_all_vehicles_response/get_all_vehicles_response.dart';

part 'api_service.g.dart';


@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @MultiPart()
  @POST(Constants.applyEndpoint)
  Future<ApplyResponse> apply(@Body() FormData formData);

  @GET(Constants.getAllVehiclesEndpoint)
  Future<GetAllVehiclesResponse> getAllVehicles();
}
