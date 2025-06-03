import 'package:injectable/injectable.dart' ;
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:tracking_app/features/profile/data/model/get_logged_driver_data_response.dart';
import 'package:tracking_app/features/profile/data/model/get_vehicle_response.dart';
import 'package:tracking_app/features/profile/domain/repos/profile_repo.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl extends ProfileRepo {
  ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepoImpl(this.profileRemoteDataSource);

  @override
  Future<ApiResult<GetLoggedDriverDataResponse>> getLoggedDriverData() async{
    return await profileRemoteDataSource.getLoggedDriverData();

  }

  @override
  Future<ApiResult<GetVehicleResponse>> getVechileName(String vehicleId) async{
    return await profileRemoteDataSource.getVechileName(vehicleId);

  }



}
