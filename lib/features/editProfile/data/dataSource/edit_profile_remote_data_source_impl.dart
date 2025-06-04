import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/editProfile/data/dataSource/edit_profile_remote_data_source.dart';
import 'package:tracking_app/features/editProfile/data/model/user_response/driver.dart';
import 'package:tracking_app/features/editProfile/data/model/user_response/user_response.dart';

@Injectable(as: EditProfileRemoteDataSource)
class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSource {
  ApiService apiService;
  EditProfileRemoteDataSourceImpl({required this.apiService});

  @override
  Future<ApiResult<UserResponse>> editProfile(Driver driver) {
    // TODO: implement editProfile
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<String>> uploadPhoto(File photo) {
    // TODO: implement uploadPhoto
    throw UnimplementedError();
  }

  // @override
  // Future<ApiResult<UserResponse>> editProfile(Driver driver) async {
  //   try {
  //     final response = await apiService.editProfile(driver);
  //     return ApiResult.success(response);
  //   } catch (e) {
  //     return ApiResult.failure(e.toString());
  //   }
  // }

  // @override
  // Future<ApiResult<String>> uploadPhoto(File photo) async {
  //   return
  //   apiService.uploadPhoto(image);
  // }
}  
//  apiExecuter<GetLoggedDriverDataResponse>(() async {
//       var response = await apiService.getLoggedDriverData();

//       return response;
//     },"ProfileRemoteDataSourceImpl");
//   }



  // @override
  // Future<UserResponse> editProfile(UpdatedUserModel user) async {
  //   final response = await apiService.editProfile(user);
  //   return response;
  // }

  // @override
  // Future<String> uploadPhoto(File photo) async {
  //   final response = await apiService.uploadPhoto(photo);
  //   return response;
  // }

