import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_excuter.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/auth/apply/data/data_source/auth_remote_data_source.dart';
import 'package:tracking_app/features/auth/apply/data/models/apply_model/apply_data.dart';
import 'package:tracking_app/features/auth/apply/data/models/apply_model/apply_response/apply_response.dart';
import 'package:tracking_app/features/auth/apply/data/models/get_all_vehicles_response/get_all_vehicles_response.dart';
import 'package:tracking_app/features/auth/apply/domain/repos/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});
  @override
  Future<ApiResult<ApplyResponse>> apply(ApplyData applyData) async {
    return await apiExecuter<ApplyResponse>(
      () async => await authRemoteDataSource.apply(applyData),
      " Error AuthRepoImpl apply method",
    );
  }

  @override
  Future<ApiResult<GetAllVehiclesResponse>> getAllVehicles() async {
    return await apiExecuter<GetAllVehiclesResponse>(() async {
      return await authRemoteDataSource.getAllVehicles();
    }, "Error AuthRepoImpl getAllVehicles method");
  }
}
