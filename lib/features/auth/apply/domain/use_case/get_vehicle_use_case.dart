import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/auth/apply/data/models/get_all_vehicles_response/get_all_vehicles_response.dart';
import 'package:tracking_app/features/auth/apply/domain/repos/auth_repo.dart';

@injectable
class GetVehiclesUseCase {
  final AuthRepo authRepo;

  GetVehiclesUseCase(this.authRepo);

  Future<ApiResult<GetAllVehiclesResponse>> call() async {
    return await authRepo.getAllVehicles();
  }
}
