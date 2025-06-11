import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/profile/data/model/get_logged_driver_data_response.dart';
import 'package:tracking_app/features/profile/data/model/get_vehicle_response.dart';

abstract class ProfileRemoteDataSource {
  Future<ApiResult<GetLoggedDriverDataResponse>> getLoggedDriverData();
  Future<ApiResult<GetVehicleResponse>> getVechileName(String vehicleId);
  Future<Map<String, dynamic>> changePassword(Map<String, dynamic> data);
}
