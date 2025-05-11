import 'package:tracking_app/features/auth/apply/data/models/apply_model/apply_data.dart';
import 'package:tracking_app/features/auth/apply/data/models/apply_model/apply_response/apply_response.dart';
import 'package:tracking_app/features/auth/apply/data/models/get_all_vehicles_response/get_all_vehicles_response.dart';

abstract class AuthRemoteDataSource {
  Future<ApplyResponse> apply(ApplyData applyData);
  Future<GetAllVehiclesResponse> getAllVehicles();
}
