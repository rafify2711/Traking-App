import 'dart:io';

import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/editProfile/data/model/user_response/driver.dart';
import 'package:tracking_app/features/editProfile/data/model/user_response/user_response.dart';


abstract class EditProfileRepo  {
  Future <ApiResult<UserResponse>> editProfile(Driver driver);
  Future<ApiResult<String>> uploadPhoto(File photo);
}