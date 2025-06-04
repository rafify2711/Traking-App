import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/editProfile/data/dataSource/edit_profile_remote_data_source.dart';
import 'package:tracking_app/features/editProfile/data/model/user_response/driver.dart';
import 'package:tracking_app/features/editProfile/data/model/user_response/user_response.dart';
import 'package:tracking_app/features/editProfile/domain/repository/edit_profile_repo.dart';


@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl implements EditProfileRepo {
EditProfileRemoteDataSource dataSource;
EditProfileRepoImpl(this.dataSource);

  @override
  Future<ApiResult<UserResponse>> editProfile(Driver driver) async{
    return await dataSource.editProfile(driver);
  }

  @override
  Future<ApiResult<String>> uploadPhoto(File photo) async{
    return await dataSource.uploadPhoto(photo);
  }
 
   
  
  
}