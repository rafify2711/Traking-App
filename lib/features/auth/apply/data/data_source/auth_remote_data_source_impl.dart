import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/features/auth/apply/data/data_source/auth_remote_data_source.dart';
import 'package:tracking_app/features/auth/apply/data/models/apply_model/apply_data.dart';
import 'package:tracking_app/features/auth/apply/data/models/apply_model/apply_response/apply_response.dart';
import 'package:tracking_app/features/auth/apply/data/models/get_all_vehicles_response/get_all_vehicles_response.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl({required this.apiService});
  @override
  Future<ApplyResponse> apply(ApplyData applyData) async {
    final formData = await applyData.toFormData();
    final response = await apiService.apply(formData);
    log("data in AuthRemoteDataSourceImpl apply method $response");
    return response;
  }

  @override
  Future<GetAllVehiclesResponse> getAllVehicles() async {
    final response = await apiService.getAllVehicles();
    return response;
  }
}
