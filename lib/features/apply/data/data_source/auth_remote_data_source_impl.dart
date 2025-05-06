import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/features/apply/data/data_source/auth_remote_data_source.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_data.dart';
import 'package:tracking_app/features/apply/data/models/apply_model/apply_response/apply_response.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl({required this.apiService});
  @override
  Future<ApplyResponse> apply(ApplyData applyData) async {
    log('applayData in AuthRemoteDataSourceImpl apply method ${applyData.country} ${applyData.email}${applyData.vehicleType}');

    final formData = await applyData.toFormData();
    
    final response = await apiService.apply(formData);
    log("data in AuthRemoteDataSourceImpl apply method $response");
    return response;
  }
}
