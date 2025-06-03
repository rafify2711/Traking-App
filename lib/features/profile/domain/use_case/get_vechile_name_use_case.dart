import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/profile/data/model/get_logged_driver_data_response.dart';
import 'package:tracking_app/features/profile/data/model/get_vehicle_response.dart';
import 'package:tracking_app/features/profile/domain/repos/profile_repo.dart';

@injectable
class GetVechileNameUseCase {
  ProfileRepo profileRepo;
  GetVechileNameUseCase(this.profileRepo);

  Future<ApiResult<GetVehicleResponse>> invoke(String vehicleId) async {
    return await profileRepo.getVechileName(vehicleId);
  }


}
