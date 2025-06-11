import 'dart:io';

import 'package:tracking_app/features/editProfile/data/model/updated_user_model.dart';

import 'package:tracking_app/features/editProfile/data/model/user_response/user_response.dart';

abstract class EditProfileRemoteDataSource {
  Future<UserResponse> editProfile(UpdatedUserModel user);
  Future<String> uploadPhoto(File photo);
}
