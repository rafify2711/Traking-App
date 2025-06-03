
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:tracking_app/features/profile/data/model/get_logged_driver_data_response.dart';
import 'package:tracking_app/features/profile/data/model/get_vehicle_response.dart';

import '../../../../core/base/api_excuter.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiService apiService;

  ProfileRemoteDataSourceImpl({required this.apiService});

  @override
  Future<ApiResult<GetLoggedDriverDataResponse>> getLoggedDriverData()async {
    return apiExecuter<GetLoggedDriverDataResponse>(() async {
      var response = await apiService.getLoggedDriverData();

      return response;
    },"ProfileRemoteDataSourceImpl");
  }

  @override
  Future<ApiResult<GetVehicleResponse>> getVechileName(String vehicleId)async {
    return apiExecuter<GetVehicleResponse>(() async {
      var response = await apiService.getSpecificVehicleName(vehicleId);

      return response;
    },"ProfileRemoteDataSourceImpl");
  }
}
