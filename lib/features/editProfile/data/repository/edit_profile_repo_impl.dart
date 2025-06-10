import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/editProfile/data/dataSource/edit_profile_remote_data_source.dart';
import 'package:tracking_app/features/editProfile/data/model/updated_user_model.dart';
import 'package:tracking_app/features/editProfile/data/model/user_response/user_response.dart';
import 'package:tracking_app/features/editProfile/domain/repository/edit_profile_repo.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl implements EditProfileRepo {
  EditProfileRemoteDataSource remoteDataSource;
  EditProfileRepoImpl({required this.remoteDataSource});

  @override
  Future<ApiResult<UserResponse>> editProfile(UpdatedUserModel user) async {
    return await remoteDataSource.editProfile(user);
  }

  @override
  Future<ApiResult<String>> uploadPhoto(File photo) async {
    return await remoteDataSource.uploadPhoto(photo);
  }
}
