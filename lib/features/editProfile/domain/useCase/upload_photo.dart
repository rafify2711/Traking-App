import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/features/editProfile/domain/repository/edit_profile_repo.dart';
@injectable
class UploadPhoto {
  EditProfileRepo editProfileRepo;
  UploadPhoto(this.editProfileRepo);

  Future<ApiResult<String>> uploadPhoto(File photo) async {
    return await editProfileRepo.uploadPhoto(photo);
  }
}
