import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/api_manger/upload_image_api_manager.dart';
import 'package:tracking_app/features/editProfile/data/dataSource/edit_profile_remote_data_source.dart';
import 'package:tracking_app/features/editProfile/data/model/updated_user_model.dart';
import 'package:tracking_app/features/editProfile/data/model/user_response/user_response.dart';

@Injectable(as: EditProfileRemoteDataSource)
class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSource {
  ApiService apiService;
  UploadImageApiManager uploadImageApiManager;
  EditProfileRemoteDataSourceImpl({required this.apiService,required this.uploadImageApiManager});

  @override
  Future<UserResponse> editProfile(UpdatedUserModel user) async {
    return await apiService.editProfile(user);
  }

  @override
  Future<String> uploadPhoto(File photo) async {
    return await uploadImageApiManager.uploadImage(photo);
  }
}
